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

ActiveRecord::Schema.define(version: 20140927032247) do

  create_table "coupons", force: true do |t|
    t.integer  "item_id"
    t.integer  "discount"
    t.integer  "store_id"
    t.string   "barcode"
    t.date     "active_date"
    t.date     "deactivate_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.date     "dob"
    t.string   "gender"
    t.string   "phone"
    t.string   "location"
    t.integer  "store_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.string   "barcode"
    t.integer  "store_id"
    t.string   "unit"
    t.boolean  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.integer  "item_id"
    t.integer  "author_id"
    t.string   "preptime"
    t.string   "cooktime"
    t.integer  "review_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", force: true do |t|
    t.string   "location"
    t.string   "hours"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
