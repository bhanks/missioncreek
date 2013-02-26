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

ActiveRecord::Schema.define(:version => 20130226200747) do

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.string   "official_url"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "tier"
    t.integer  "order"
    t.string   "soundcloud_url"
    t.string   "youtube_url"
    t.string   "image"
    t.integer  "display_order"
    t.integer  "front_page",     :default => 0
    t.text     "bio"
    t.string   "spotify_url"
    t.string   "slug"
    t.integer  "event_id"
    t.boolean  "headliner"
  end

  add_index "artists", ["slug"], :name => "index_artists_on_slug"

  create_table "events", :force => true do |t|
    t.integer  "venue_id"
    t.string   "title"
    t.date     "date"
    t.time     "door_time"
    t.time     "start_time"
    t.boolean  "free"
    t.boolean  "soldout"
    t.integer  "price_advance"
    t.integer  "price_dayof"
    t.string   "ticket_url"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "show_title"
  end

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "nav_order"
    t.integer  "feature_order"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "slug"
    t.string   "splash_image"
    t.integer  "parent"
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "body"
  end

  create_table "simple_events", :force => true do |t|
    t.string   "title"
    t.date     "date"
    t.time     "start"
    t.boolean  "free"
    t.boolean  "soldout"
    t.text     "description"
    t.string   "type"
    t.string   "image"
    t.string   "price"
    t.string   "ticket_url"
    t.integer  "venue_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
