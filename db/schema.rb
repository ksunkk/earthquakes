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

ActiveRecord::Schema.define(version: 2019_02_17_172558) do

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

  create_table "catalogs", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.boolean "is_deleted"
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commentaries", force: :cascade do |t|
    t.integer "user_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.text "text"
    t.boolean "is_deleted", default: false
    t.boolean "is_accepted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_commentaries_on_commentable_type_and_commentable_id"
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
    t.string "poster_id"
    t.string "logo_id"
    t.boolean "is_confirmed"
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

  create_table "earthquakes_catalogs", force: :cascade do |t|
    t.bigint "earthquake_id"
    t.bigint "catalog_id"
    t.index ["catalog_id"], name: "index_earthquakes_catalogs_on_catalog_id"
    t.index ["earthquake_id"], name: "index_earthquakes_catalogs_on_earthquake_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.boolean "is_deleted", default: true
  end

  create_table "keywords_users", force: :cascade do |t|
    t.bigint "keyword_id"
    t.bigint "user_id"
    t.index ["keyword_id"], name: "index_keywords_users_on_keyword_id"
    t.index ["user_id"], name: "index_keywords_users_on_user_id"
  end

  create_table "notification_method_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "notification_method_id"
  end

  create_table "notification_methods", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
