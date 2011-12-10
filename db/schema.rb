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

ActiveRecord::Schema.define(:version => 20111210001427) do

  create_table "actions", :force => true do |t|
    t.integer  "analyzer_id",                                               :null => false
    t.decimal  "cost",        :precision => 12, :scale => 5,                :null => false
    t.integer  "amount",                                     :default => 0
    t.datetime "timestamp"
  end

  create_table "admin_notes", :force => true do |t|
    t.integer  "resource_id",     :null => false
    t.string   "resource_type",   :null => false
    t.integer  "admin_user_id"
    t.string   "admin_user_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_notes", ["admin_user_type", "admin_user_id"], :name => "index_admin_notes_on_admin_user_type_and_admin_user_id"
  add_index "admin_notes", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "analyzers", :force => true do |t|
    t.string   "name",        :null => false
    t.date     "start_date",  :null => false
    t.date     "end_date",    :null => false
    t.integer  "ctw_id",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "all_actions"
  end

  create_table "ctw_collectors", :force => true do |t|
    t.integer  "ctw_id",                                    :null => false
    t.datetime "timestamp"
    t.decimal  "pr0",       :precision => 15, :scale => 10, :null => false
    t.decimal  "pr1",       :precision => 15, :scale => 10, :null => false
    t.decimal  "pr2",       :precision => 15, :scale => 10, :null => false
    t.integer  "depth"
  end

  create_table "ctws", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quote_id"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "quotes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "values", :force => true do |t|
    t.integer  "quote_id",                                                :null => false
    t.decimal  "value",     :precision => 12, :scale => 5,                :null => false
    t.integer  "volume",                                   :default => 0
    t.datetime "timestamp"
  end

end
