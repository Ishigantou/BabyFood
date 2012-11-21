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

ActiveRecord::Schema.define(version: 20121121222544) do

  create_table "categories", force: true do |t|
    t.text     "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_recipes", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "recipe_id"
  end

  add_index "categories_recipes", ["category_id", "recipe_id"], name: "index_categories_recipes_on_category_id_and_recipe_id"
  add_index "categories_recipes", ["recipe_id", "category_id"], name: "index_categories_recipes_on_recipe_id_and_category_id"

  create_table "recipes", force: true do |t|
    t.text     "title"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_hash"
    t.string   "password_salt"
    t.date     "baby_birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
