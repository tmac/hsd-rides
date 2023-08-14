class Driver < ApplicationRecord
  include Commutable

  private

  def previous_address_changes?
    self.previous_changes.keys.intersection(['home_address']).any?
  end
end
