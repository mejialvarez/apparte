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

ActiveRecord::Schema.define(version: 20170305204029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artworks", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",        limit: 100, null: false
    t.string   "description", limit: 500, null: false
    t.bigint   "price",                   null: false
    t.integer  "score"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["user_id"], name: "index_artworks_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "talk_id"
    t.integer  "user_id"
    t.string   "body",       limit: 140, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["talk_id"], name: "index_messages_on_talk_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "talks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "artwork_id"
    t.integer  "status",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["artwork_id"], name: "index_talks_on_artwork_id", using: :btree
    t.index ["user_id", "artwork_id"], name: "index_talks_on_user_id_and_artwork_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_talks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name",  limit: 100,             null: false
    t.string   "email",      limit: 100,             null: false
    t.bigint   "phone"
    t.integer  "role",                   default: 0, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "artworks", "users"
  add_foreign_key "messages", "talks"
  add_foreign_key "messages", "users"
  add_foreign_key "talks", "artworks"
  add_foreign_key "talks", "users"
end
