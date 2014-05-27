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

ActiveRecord::Schema.define(version: 20140527033129) do

  create_table "bikes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rides", force: true do |t|
    t.integer  "bike_id"
    t.integer  "route_id"
    t.date     "rode_on"
    t.decimal  "distance",   precision: 6, scale: 3
    t.decimal  "speed",      precision: 3, scale: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes"
  end

  add_index "rides", ["bike_id"], name: "index_rides_on_bike_id"
  add_index "rides", ["route_id"], name: "index_rides_on_route_id"

  create_table "routes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
