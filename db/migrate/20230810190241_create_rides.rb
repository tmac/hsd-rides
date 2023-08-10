class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides do |t|
      t.string :start_address
      t.string :destination_address
      t.decimal :distance, precision: 5, scale: 2
      t.decimal :duration, precision: 4, scale: 2
      t.decimal :earnings, precision: 6, scale: 2
      t.datetime :distance_and_duration_updated_at
      t.timestamps
    end
  end
end
