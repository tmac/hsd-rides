class Driver < ApplicationRecord
  after_commit :create_commutes, on: :create

  has_many :commutes, dependent: :delete_all

  private

  def create_commutes
    CommuteCreationJob.perform_later(self)
  end
end
