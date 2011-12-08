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

ActiveRecord::Schema.define(:version => 20111208111421) do

  create_table "actions", :force => true do |t|
    t.integer  "analyzer_id",                                               :null => false
    t.decimal  "cost",        :precision => 12, :scale => 5,                :null => false
    t.integer  "amount",                                     :default => 0
    t.datetime "timestamp"
  end

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
