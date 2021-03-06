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

ActiveRecord::Schema.define(version: 2020_04_01_094052) do

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

  create_table "investments", force: :cascade do |t|
    t.date "entry_date"
    t.date "exit_date"
    t.bigint "user_id"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount_cents", default: 0, null: false
    t.index ["property_id"], name: "index_investments_on_property_id"
    t.index ["user_id"], name: "index_investments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "property_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_likes_on_property_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "checkout_session_id"
    t.bigint "user_id"
    t.integer "amount_cents", default: 0, null: false
    t.bigint "investment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["investment_id"], name: "index_orders_on_investment_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "sales_proceeds"
    t.string "location"
    t.integer "valuation"
    t.string "name"
    t.string "description"
    t.integer "amount_to_be_raised"
    t.string "financials"
    t.string "area_description"
    t.bigint "user_id"
    t.integer "dividend"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "end_date"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "saved_properties", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_saved_properties_on_property_id"
    t.index ["user_id"], name: "index_saved_properties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.boolean "validated_developer"
    t.string "phone_number"
    t.date "date_of_birth"
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.boolean "validated_investor"
    t.string "description"
    t.integer "experience_dev"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "investments", "properties"
  add_foreign_key "investments", "users"
  add_foreign_key "likes", "properties"
  add_foreign_key "likes", "users"
  add_foreign_key "orders", "investments"
  add_foreign_key "orders", "users"
  add_foreign_key "properties", "users"
  add_foreign_key "saved_properties", "properties"
  add_foreign_key "saved_properties", "users"
end
