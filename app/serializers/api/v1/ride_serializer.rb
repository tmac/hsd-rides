class Api::V1::RideSerializer < ActiveModel::Serializer
  attributes :start_address, 
             :destination_address,
             :distance,
             :duration,
             :earnings,
             :score
end