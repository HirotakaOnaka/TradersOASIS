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

ActiveRecord::Schema.define(version: 20181016090159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "trading_method_id"
    t.index ["trading_method_id"], name: "index_favorites_on_trading_method_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.decimal "contract_rate"
    t.decimal "pips"
    t.text "comment"
    t.string "image1"
    t.string "image2"
    t.string "trading_method"
    t.string "score"
    t.decimal "lot"
    t.string "pair"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "entry_rate"
    t.bigint "user_id"
    t.datetime "entry_date"
    t.datetime "contract_date"
    t.string "order"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "trading_methods", force: :cascade do |t|
    t.string "title"
    t.string "introduction"
    t.string "style"
    t.string "pair"
    t.string "indicator"
    t.string "market"
    t.string "chart"
    t.text "content1"
    t.text "content2"
    t.text "content3"
    t.string "image1"
    t.string "image2"
    t.string "image3"
    t.text "summery"
    t.integer "favorites_count"
    t.integer "usefuls_count"
    t.integer "unusefuls_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_trading_methods_on_user_id"
  end

  create_table "unusefuls", force: :cascade do |t|
    t.integer "user_id"
    t.integer "trading_method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usefuls", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "trading_method_id"
    t.index ["trading_method_id"], name: "index_usefuls_on_trading_method_id"
    t.index ["user_id"], name: "index_usefuls_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "trading_methods"
  add_foreign_key "favorites", "users"
  add_foreign_key "notes", "users"
  add_foreign_key "trading_methods", "users"
  add_foreign_key "usefuls", "trading_methods"
  add_foreign_key "usefuls", "users"
end
