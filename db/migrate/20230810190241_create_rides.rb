class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides do |t|
      t.string :start_address
      t.string :destination_address
      t.decimal :distance, precision: 8, scale: 2
      t.decimal :duration, precision: 8, scale: 2
      t.decimal :earnings, precision: 8, scale: 2
      t.datetime :calculations_updated_at
      t.timestamps
    end
  end
end
