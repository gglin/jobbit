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

ActiveRecord::Schema.define(:version => 20130819060332) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "crunchbase_url"
    t.string   "linkedin_url"
    t.string   "glassdoor_url"
    t.string   "twitter_username"
    t.string   "number_of_employees"
    t.string   "founded_year"
    t.text     "overview"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "description"
    t.string   "total_money_raised"
    t.text     "funding_rounds"
    t.integer  "num_of_1st_connections"
    t.integer  "num_of_2nd_connections"
    t.integer  "avg_glassdoor_rating"
    t.integer  "num_glassdoor_ratings"
    t.text     "notes"
  end

  create_table "employees", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "twitter"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "employments", :force => true do |t|
    t.string   "employee_id"
    t.string   "company_id"
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "identities", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "uid"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "twitter"
    t.string   "linkedin"
  end

end
