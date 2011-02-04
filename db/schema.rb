# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110204203548) do

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
  end

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

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "menu_url"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.integer  "lunch_bucks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
