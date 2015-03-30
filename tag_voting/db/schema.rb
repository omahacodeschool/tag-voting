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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150330184623) do

  create_table "admins", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "awards", :force => true do |t|
    t.text     "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ballots", :force => true do |t|
    t.integer  "member_id"
    t.integer  "voting_period_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "ballots_productions", :force => true do |t|
    t.integer  "production_id"
    t.integer  "ballot_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "secret_voter_id"
    t.boolean  "voted"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "nominations", :force => true do |t|
    t.integer  "award_id"
    t.integer  "ballot_id"
    t.text     "nom1"
    t.text     "nom2"
    t.text     "nom3"
    t.text     "nom4"
    t.text     "nom5"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "productions", :force => true do |t|
    t.text     "theater"
    t.text     "name"
    t.string   "genre"
    t.string   "year"
    t.integer  "voting_period_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "voting_periods", :force => true do |t|
    t.datetime "open_date"
    t.datetime "cose_date"
    t.string   "season"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
