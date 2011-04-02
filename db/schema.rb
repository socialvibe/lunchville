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

ActiveRecord::Schema.define(:version => 20110402003000) do

  create_table "lunches", :force => true do |t|
    t.date     "occuring_on"
    t.integer  "winning_proposal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lunches", ["winning_proposal_id"], :name => "index_lunches_on_winning_proposal_id"

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lunch_id"
  end

  add_index "orders", ["lunch_id"], :name => "index_orders_on_lunch_id"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "proposals", :force => true do |t|
    t.integer  "lunch_id"
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.integer  "votes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proposals", ["lunch_id"], :name => "index_proposals_on_lunch_id"
  add_index "proposals", ["restaurant_id"], :name => "index_proposals_on_restaurant_id"
  add_index "proposals", ["user_id"], :name => "index_proposals_on_user_id"

  create_table "rates", :force => true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "stars",         :null => false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], :name => "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], :name => "index_rates_on_rater_id"

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "menu_url"
    t.boolean  "family_style"
    t.string   "image_url",    :limit => nil
    t.string   "yelp_url"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.integer  "lunch_bucks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
    t.string   "user_hash"
  end

  create_table "votes", :force => true do |t|
    t.boolean  "vote",          :default => false
    t.integer  "voteable_id",                      :null => false
    t.string   "voteable_type",                    :null => false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_id", "voteable_type"], :name => "index_votes_on_voteable_id_and_voteable_type"
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
