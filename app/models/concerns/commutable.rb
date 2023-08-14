require "active_support/concern"

module Commutable
  extend ActiveSupport::Concern

  included do
    after_commit :create_commutes,    on: :create
    after_commit :rebuild_commutes,   on: :update, if: :previous_address_changes?

    has_many :commutes, dependent: :delete_all

    private

    def create_commutes
      CommuteCreationJob.perform_later(self)
    end

    def rebuild_commutes
      self.commutes.destroy_all
      CommuteCreationJob.perform_later(self)
    end

    def previous_address_changes?
      raise NotImplementedError
    end
  end
end


