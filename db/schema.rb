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

ActiveRecord::Schema.define(version: 20150708091724) do

  create_table "qadb_results", force: :cascade do |t|
    t.string   "testsuite",                  null: false
    t.integer  "succeeded",      default: 0, null: false
    t.integer  "failed",         default: 0, null: false
    t.integer  "skipped",        default: 0, null: false
    t.integer  "internal_error", default: 0, null: false
    t.string   "log_url",                    null: false
    t.datetime "test_date",                  null: false
  end

end