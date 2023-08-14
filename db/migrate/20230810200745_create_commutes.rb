class CreateCommutes < ActiveRecord::Migration[7.0]
  def change
    create_table :commutes do |t|
      t.references :driver, null: false, foreign_key: true
      t.references :ride, null: false, foreign_key: true
      t.decimal :distance, precision: 8, scale: 2
      t.decimal :duration, precision: 8, scale: 2
      t.decimal :ride_score, precision: 8, scale: 2
      t.datetime :calculations_updated_at
      t.timestamps
    end
  end
end
