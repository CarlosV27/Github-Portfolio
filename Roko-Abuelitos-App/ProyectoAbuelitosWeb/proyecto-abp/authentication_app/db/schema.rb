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

ActiveRecord::Schema[7.0].define(version: 2022_10_19_001636) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.string "speciality"
    t.string "photo"
    t.string "consulting_room"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "pacients", force: :cascade do |t|
    t.integer "height"
    t.integer "weight"
    t.string "blood"
    t.string "diseases"
    t.string "zone"
    t.string "church"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "doctor_id"
    t.index ["doctor_id"], name: "index_pacients_on_doctor_id"
    t.index ["user_id"], name: "index_pacients_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "age"
    t.string "gender"
    t.string "city"
    t.string "state"
    t.bigint "doctor_id"
    t.bigint "pacient_id"
    t.string "is_type"
    t.index ["doctor_id"], name: "index_users_on_doctor_id"
    t.index ["pacient_id"], name: "index_users_on_pacient_id"
  end

  add_foreign_key "doctors", "users"
  add_foreign_key "pacients", "doctors"
  add_foreign_key "pacients", "users"
  add_foreign_key "users", "doctors"
  add_foreign_key "users", "pacients"
end
