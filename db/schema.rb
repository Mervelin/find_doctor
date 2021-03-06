# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170624155756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "email"
    t.text     "description"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "phone"
    t.string   "specialization"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_doctors_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true, using: :btree
  end

  create_table "offices", force: :cascade do |t|
    t.integer  "doctor_id"
    t.string   "city"
    t.string   "postal_code"
    t.string   "street"
    t.string   "nr"
    t.text     "info"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_patients_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true, using: :btree
  end

  create_table "timetables", force: :cascade do |t|
    t.integer  "doctor_id"
    t.integer  "office_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "day_of_week"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["doctor_id", "office_id"], name: "index_timetables_on_doctor_id_and_office_id", using: :btree
  end

  create_table "visits", force: :cascade do |t|
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.integer  "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.index ["doctor_id", "patient_id", "office_id"], name: "index_visits_on_doctor_id_and_patient_id_and_office_id", using: :btree
  end

end
