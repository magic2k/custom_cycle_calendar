# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130725145422) do

  create_table "bicycles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bicycle_photo_file_name"
    t.string   "bicycle_photo_content_type"
    t.integer  "bicycle_photo_file_size"
    t.datetime "bicycle_photo_updated_at"
  end

  add_index "bicycles", ["name"], name: "index_bicycles_on_name"

  create_table "rents", force: true do |t|
    t.datetime "date"
    t.string   "renter_name"
    t.integer  "bicycle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rents", ["bicycle_id", "date"], name: "index_rents_on_bicycle_id_and_date", unique: true

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.integer  "rent_id"
    t.boolean  "admin",           default: false
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["name"], name: "index_users_on_name"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
