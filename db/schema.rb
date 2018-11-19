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

ActiveRecord::Schema.define(version: 2018_11_17_031048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cards", force: :cascade do |t|
    t.string "sid"
    t.string "origin"
    t.datetime "date_given"
    t.datetime "last_ridden", default: "2018-11-17 03:22:01"
    t.datetime "last_pumped", default: "2018-11-17 03:22:01"
    t.integer "points"
    t.integer "points_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pumps", force: :cascade do |t|
    t.integer "is_valid"
    t.bigint "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "scanner_id"
    t.index ["card_id"], name: "index_pumps_on_card_id"
    t.index ["scanner_id"], name: "index_pumps_on_scanner_id"
  end

  create_table "scanners", force: :cascade do |t|
    t.string "key"
    t.bigint "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_refilled", default: -> { "now()" }
    t.index ["station_id"], name: "index_scanners_on_station_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.string "line"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pumps", "cards"
  add_foreign_key "pumps", "scanners"
  add_foreign_key "scanners", "stations"
end
