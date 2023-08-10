# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_10_200745) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commutes", force: :cascade do |t|
    t.bigint "driver_id", null: false
    t.bigint "ride_id", null: false
    t.decimal "distance", precision: 5, scale: 2
    t.decimal "duration", precision: 4, scale: 2
    t.datetime "distance_and_duration_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_commutes_on_driver_id"
    t.index ["ride_id"], name: "index_commutes_on_ride_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "home_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rides", force: :cascade do |t|
    t.string "start_address"
    t.string "destination_address"
    t.decimal "distance", precision: 5, scale: 2
    t.decimal "duration", precision: 4, scale: 2
    t.decimal "earnings", precision: 6, scale: 2
    t.datetime "distance_and_duration_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "commutes", "drivers"
  add_foreign_key "commutes", "rides"
end
