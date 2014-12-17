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

ActiveRecord::Schema.define(version: 20141217040125) do

  create_table "lineups", force: true do |t|
    t.integer  "user_id",                null: false
    t.integer  "store_id",               null: false
    t.integer  "cnt",                    null: false
    t.integer  "person_cnt", default: 1, null: false
    t.datetime "check_in"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", force: true do |t|
    t.string   "reg_no",     limit: 12,                  null: false
    t.string   "name",       limit: 100,                 null: false
    t.string   "addr"
    t.string   "location"
    t.string   "tel",        limit: 20
    t.time     "open_time"
    t.time     "close_time"
    t.boolean  "wait",                   default: false, null: false
    t.integer  "cnt",                    default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

  create_table "users", force: true do |t|
    t.string   "name",       limit: 50, null: false
    t.string   "phone",      limit: 20, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
