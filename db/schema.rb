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

ActiveRecord::Schema.define(version: 2021_12_25_071544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "user_type"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "markets", force: :cascade do |t|
    t.string "symbol"
    t.string "exchange"
    t.string "exchangeSuffix"
    t.string "exchangeName"
    t.string "exchangeSegment"
    t.string "name"
    t.string "date"
    t.string "type_weight"
    t.string "iexId"
    t.string "region"
    t.string "currency"
    t.string "isEnabled"
    t.string "figi"
    t.string "cik"
    t.string "lei"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "exchangeSegmentName"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.bigint "latest_price"
    t.integer "change_percent"
    t.string "symbol"
    t.string "company_logo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "trader_id", null: false
    t.integer "quantity"
    t.index ["trader_id"], name: "index_stocks_on_trader_id"
  end

  create_table "traders", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.bigint "total_cash"
    t.integer "total_stocks"
    t.integer "profit"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.index ["user_id"], name: "index_traders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "password_confirm"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "encrypted_password"
    t.string "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
  end

  add_foreign_key "admins", "users"
  add_foreign_key "stocks", "traders"
  add_foreign_key "traders", "users"
end
