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

ActiveRecord::Schema.define(version: 2018_12_10_085528) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "reviewer"
    t.integer "rate"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shop_id"
    t.index ["shop_id"], name: "index_reviews_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "station"
    t.string "prefucture"
    t.string "city"
    t.string "address"
    t.string "url"
    t.string "tell_num"
    t.string "shop_image"
    t.integer "features"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "start_time"
    t.integer "end_time"
    t.string "holidays"
    t.string "wifi"
    t.string "sockets"
    t.string "non_smorker"
    t.string "smorker"
    t.string "mid_night"
    t.string "close_from_station"
    t.string "parking"
    t.string "co_working"
    t.string "printer"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "user_image"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
