module Addressable
  extend ActiveSupport::Concern

  class << self
    def likable?(klass)
      klass = klass.is_a?(String) ? klass.safe_constantize : klass
      klass < Likable
    end
  end

  included do
    has_many :likes, as: :likable, dependent: :destroy
  end
end