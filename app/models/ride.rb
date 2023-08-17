class Ride < ApplicationRecord
  include Commutable

  after_commit :queue_calculations, on: [:create, :update], if: :perform_calculations?
  
  has_many :drivers, through: :commutes

  private

  # Callbacks

  def queue_calculations
    RideCalculationsJob.perform_later(self)
  end

  # Helpers

  def perform_calculations?
    self.previously_new_record? || previous_address_changes?
  end

  def previous_address_changes?
    self.previous_changes.keys.intersection(['start_address','destination_address']).any?
  end
end
