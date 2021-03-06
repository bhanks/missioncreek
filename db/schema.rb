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

ActiveRecord::Schema.define(:version => 20140319162355) do

  create_table "admin_users", :force => true do |t|
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

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.string   "official_url"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "tier"
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
    t.integer  "event_order"
    t.boolean  "lit_fest"
    t.boolean  "featured"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.boolean  "visible"
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
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "show_title"
    t.string   "type"
    t.boolean  "visible"
    t.boolean  "reservations"
    t.string   "reservation_url"
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
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "slug"
    t.string   "splash_image"
    t.integer  "parent"
    t.string   "simple_event_category"
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
    t.string   "image"
    t.string   "price"
    t.string   "ticket_url"
    t.integer  "venue_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "category"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], :name => "taggings_idx", :unique => true

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

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

  create_table "whitelists", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
