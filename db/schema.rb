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

ActiveRecord::Schema.define(version: 2020_06_09_195500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "consult_id"
    t.bigint "doctor_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consult_id"], name: "index_answers_on_consult_id"
    t.index ["doctor_id"], name: "index_answers_on_doctor_id"
  end

  create_table "bills", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.text "body"
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_bills_on_doctor_id"
    t.index ["patient_id"], name: "index_bills_on_patient_id"
  end

  create_table "cart_details", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "medicament_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_details_on_cart_id"
    t.index ["medicament_id"], name: "index_cart_details_on_medicament_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_carts_on_patient_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consult_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consults", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.bigint "speciality_id"
    t.string "subject"
    t.text "symptoms"
    t.integer "closed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "answered"
    t.index ["doctor_id"], name: "index_consults_on_doctor_id"
    t.index ["patient_id"], name: "index_consults_on_patient_id"
    t.index ["speciality_id"], name: "index_consults_on_speciality_id"
  end

  create_table "covid_conditions", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "condition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condition_id"], name: "index_covid_conditions_on_condition_id"
    t.index ["patient_id"], name: "index_covid_conditions_on_patient_id"
  end

  create_table "d_services", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "doctor_id"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_d_services_on_doctor_id"
    t.index ["service_id"], name: "index_d_services_on_service_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "lastname"
    t.string "email", default: "", null: false
    t.string "license"
    t.bigint "speciality_id"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "cellphone"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_doctors_on_confirmation_token", unique: true
    t.index ["email"], name: "index_doctors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true
    t.index ["speciality_id"], name: "index_doctors_on_speciality_id"
  end

  create_table "medicaments", force: :cascade do |t|
    t.string "name"
    t.bigint "type_medication_id"
    t.string "active"
    t.string "presentation"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_medication_id"], name: "index_medicaments_on_type_medication_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "lastname"
    t.datetime "birth"
    t.string "email", default: "", null: false
    t.text "allergy"
    t.text "chronic_diseases"
    t.text "surgeries"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "cellphone"
    t.float "latitude"
    t.float "longitude"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "patient_id"
    t.string "name"
    t.string "lastname"
    t.bigint "number"
    t.integer "secret_code"
    t.string "exdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_payments_on_patient_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.bigint "consult_type_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subject"
    t.index ["consult_type_id"], name: "index_prescriptions_on_consult_type_id"
    t.index ["doctor_id"], name: "index_prescriptions_on_doctor_id"
    t.index ["patient_id"], name: "index_prescriptions_on_patient_id"
  end

  create_table "sell_details", force: :cascade do |t|
    t.bigint "sell_id"
    t.bigint "medicament_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicament_id"], name: "index_sell_details_on_medicament_id"
    t.index ["sell_id"], name: "index_sell_details_on_sell_id"
  end

  create_table "sells", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "shipping_id"
    t.bigint "payment_id"
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_sells_on_patient_id"
    t.index ["payment_id"], name: "index_sells_on_payment_id"
    t.index ["shipping_id"], name: "index_sells_on_shipping_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shippings", force: :cascade do |t|
    t.bigint "patient_id"
    t.string "city"
    t.string "state"
    t.string "country"
    t.bigint "postal_code"
    t.string "name"
    t.string "lastname"
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_shippings_on_patient_id"
  end

  create_table "specialities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.bigint "medicament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicament_id"], name: "index_stores_on_medicament_id"
  end

  create_table "type_medications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "consults"
  add_foreign_key "answers", "doctors"
  add_foreign_key "bills", "doctors"
  add_foreign_key "bills", "patients"
  add_foreign_key "cart_details", "carts"
  add_foreign_key "cart_details", "medicaments"
  add_foreign_key "carts", "patients"
  add_foreign_key "consults", "doctors"
  add_foreign_key "consults", "patients"
  add_foreign_key "consults", "specialities"
  add_foreign_key "covid_conditions", "conditions"
  add_foreign_key "covid_conditions", "patients"
  add_foreign_key "d_services", "doctors"
  add_foreign_key "d_services", "services"
  add_foreign_key "medicaments", "type_medications"
  add_foreign_key "payments", "patients"
  add_foreign_key "prescriptions", "consult_types"
  add_foreign_key "prescriptions", "doctors"
  add_foreign_key "prescriptions", "patients"
  add_foreign_key "sell_details", "medicaments"
  add_foreign_key "sell_details", "sells"
  add_foreign_key "sells", "patients"
  add_foreign_key "sells", "payments"
  add_foreign_key "sells", "shippings"
  add_foreign_key "shippings", "patients"
  add_foreign_key "stores", "medicaments"
end
