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

ActiveRecord::Schema.define(:version => 20120327023302) do

  create_table "categories", :force => true do |t|
    t.string "name"
    t.string "description"
  end

  create_table "file_attachments", :force => true do |t|
    t.string   "attachment_file_file_name"
    t.string   "attachment_file_content_type"
    t.integer  "attachment_file_file_size"
    t.datetime "attachment_file_updated_at"
    t.string   "name"
    t.integer  "subcategory_id"
  end

  create_table "subcategories", :force => true do |t|
    t.string "name"
    t.string "description"
    t.integer "category_id"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
