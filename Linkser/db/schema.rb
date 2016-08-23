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

ActiveRecord::Schema.define(version: 20160823193727) do

  create_table "instagram", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "times_visited"
    t.string   "category"
    t.string   "tags"
    t.text     "description"
    t.string   "content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "times_visited"
    t.string   "category"
    t.string   "tags"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "object_type"
    t.string   "content_type"
  end

end
