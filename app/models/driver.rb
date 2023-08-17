class Driver < ApplicationRecord
  include Commutable

  # I believe the .includes is implicit but can't hurt.
  has_many :rides, -> { order(ride_score: :desc).includes(:commutes) }, through: :commutes

  private

  def previous_address_changes?
    self.previous_changes.keys.intersection(['home_address']).any?
  end
end
