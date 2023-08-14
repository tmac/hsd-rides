class Ride < ApplicationRecord
  after_commit :queue_calculations, on: [:create, :update], if: :perform_calculations?
  after_commit :create_commutes,    on: :create
  after_commit :rebuild_commutes,   on: :update, if: :previous_address_changes?

  has_many :commutes, dependent: :delete_all

  scope :with_score_for_driver, -> (driver) { 
    joins(:commutes)
    .select("rides.*, commutes.ride_score AS score, commutes.duration AS cummute_duration, 
             commutes.distance AS cummute_distance")
    .where('commutes.driver_id': driver.id) 
    .order(ride_score: :desc)
  }
  
  private

  # Callbacks

  def queue_calculations
    RideCalculationsJob.perform_later(self)
  end

  def create_commutes
    CommuteCreationJob.perform_later(self)
  end

  def rebuild_commutes
    self.commutes.destroy_all
    CommuteCreationJob.perform_later(self)
  end

  # Helpers

  def perform_calculations?
    self.previously_new_record? || previous_address_changes?
  end

  def previous_address_changes?
    self.previous_changes.keys.intersection(['start_address','destination_address']).any?
  end
end
