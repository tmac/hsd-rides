class Commute < ApplicationRecord
  belongs_to :driver
  belongs_to :ride
end
