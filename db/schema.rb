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

ActiveRecord::Schema.define(version: 2018_11_01_085453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "file_link"
    t.string "author"
    t.string "source_link"
    t.string "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "conference_id"
    t.string "user_name"
    t.string "phone"
    t.boolean "is_confirmed"
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conferences", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.string "source_link"
    t.string "logo_link"
    t.string "poster_link"
    t.text "contact_info"
    t.string "city"
    t.string "street"
    t.integer "building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "needs_payment"
  end

  create_table "earthquakes", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.integer "day"
    t.integer "month"
    t.integer "hour"
    t.integer "minute"
    t.float "second"
    t.float "latitude"
    t.float "longitude"
    t.float "magnitude"
    t.text "description"
    t.string "source"
    t.string "logo"
  end

  create_table "pdf_articles", force: :cascade do |t|
    t.string "title"
    t.integer "earthquake_id"
    t.string "link"
    t.string "file_id"
    t.string "article_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.integer "earthquake_id"
    t.string "link"
    t.string "file_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
    t.string "is_deleted", default: "f"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "login", default: "", null: false
    t.string "email", default: "empty"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "surname"
    t.string "work_place"
    t.json "keywords"
    t.integer "role_id", default: 2
    t.string "phone_number"
    t.boolean "phone_confirmed", default: false
    t.boolean "email_confirmed", default: false
    t.string "provider"
    t.string "uid"
    t.integer "confirmation_fails_count"
    t.index ["login"], name: "index_users_on_login", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
