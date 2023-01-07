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

ActiveRecord::Schema.define(version: 2023_01_07_084142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "debit_cards", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "card_number", null: false
    t.string "expiration_date"
    t.integer "cvv", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_number"], name: "index_debit_cards_on_card_number", unique: true
    t.index ["user_id"], name: "index_debit_cards_on_user_id"
  end

  create_table "donations", force: :cascade do |t|
    t.decimal "amount", null: false
    t.string "note"
    t.boolean "payment_successed", default: false
    t.boolean "hidden_name", default: false
    t.boolean "hidden_amount", default: false
    t.bigint "fundraiser_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "money_box_id"
    t.index ["fundraiser_id"], name: "index_donations_on_fundraiser_id"
    t.index ["money_box_id"], name: "index_donations_on_money_box_id"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "fundraiser_updates", force: :cascade do |t|
    t.text "note", null: false
    t.bigint "fundraiser_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fundraiser_id"], name: "index_fundraiser_updates_on_fundraiser_id"
  end

  create_table "fundraisers", force: :cascade do |t|
    t.string "title", null: false
    t.date "date_of_birth"
    t.string "name"
    t.string "surname"
    t.string "reason"
    t.string "city"
    t.string "region"
    t.date "end_date"
    t.jsonb "discription"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "count", default: 0
    t.index ["discription"], name: "index_fundraisers_on_discription", using: :gin
    t.index ["user_id"], name: "index_fundraisers_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "title"
    t.string "invoice_link", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "money_boxes", force: :cascade do |t|
    t.string "title", null: false
    t.text "notification"
    t.string "qrcode"
    t.bigint "fundraiser_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fundraiser_id"], name: "index_money_boxes_on_fundraiser_id"
    t.index ["user_id"], name: "index_money_boxes_on_user_id"
  end

  create_table "observed_fundraisers", force: :cascade do |t|
    t.bigint "fundraiser_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fundraiser_id", "user_id"], name: "index_observed_fundraisers_on_fundraiser_id_and_user_id", unique: true
    t.index ["fundraiser_id"], name: "index_observed_fundraisers_on_fundraiser_id"
    t.index ["user_id"], name: "index_observed_fundraisers_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "photo", null: false
    t.bigint "fundraiser_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fundraiser_id"], name: "index_photos_on_fundraiser_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "email", null: false
    t.string "name"
    t.string "surname"
    t.string "image"
    t.text "about_me"
    t.string "website"
    t.string "city"
    t.integer "zipcode"
    t.string "street"
    t.integer "location_number"
    t.integer "phone_number"
    t.boolean "company"
    t.string "company_name"
    t.integer "nip"
    t.string "authentication_method"
    t.decimal "daily_donation_limit", default: "50000.0"
    t.boolean "receive_notifications", default: true
    t.boolean "sms_notifications", default: false
    t.decimal "sms_notifications_amount", default: "100.0"
    t.boolean "receive_invoices", default: false
    t.boolean "visible_address", default: false
    t.boolean "visible_email", default: false
    t.boolean "visible_avatar", default: true
    t.boolean "visible_phone_number", default: true
    t.boolean "visible_registration_date", default: true
    t.boolean "visible_supported_fundraisers", default: true
    t.boolean "visible_in_browser", default: true
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "debit_cards", "users"
  add_foreign_key "donations", "fundraisers"
  add_foreign_key "donations", "money_boxes"
  add_foreign_key "donations", "users"
  add_foreign_key "fundraiser_updates", "fundraisers"
  add_foreign_key "fundraisers", "users"
  add_foreign_key "invoices", "users"
  add_foreign_key "money_boxes", "fundraisers"
  add_foreign_key "money_boxes", "users"
  add_foreign_key "observed_fundraisers", "fundraisers"
  add_foreign_key "observed_fundraisers", "users"
  add_foreign_key "photos", "fundraisers"
end
