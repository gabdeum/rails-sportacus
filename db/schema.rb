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

ActiveRecord::Schema[7.0].define(version: 2022_09_09_114823) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_reviews", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "user_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_reviews_on_article_id"
    t.index ["user_id"], name: "index_article_reviews_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "address"
    t.bigint "user_id", null: false
    t.integer "daily_rate"
    t.integer "conditions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brand"
    t.integer "minimum_rent_days"
    t.index ["address"], name: "index_articles_on_address"
    t.index ["title"], name: "index_articles_on_title"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "article_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_bookings_on_article_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "surfboard_characteristics", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.string "length"
    t.integer "volume"
    t.integer "shape"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_surfboard_characteristics_on_article_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "article_reviews", "articles"
  add_foreign_key "article_reviews", "users"
  add_foreign_key "articles", "users"
  add_foreign_key "bookings", "articles"
  add_foreign_key "bookings", "users"
  add_foreign_key "surfboard_characteristics", "articles"
end
