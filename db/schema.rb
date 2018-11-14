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

ActiveRecord::Schema.define(version: 20180620185018) do

  create_table "charts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "planet_id"
    t.integer "sign_id"
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.string "ruler_of"
    t.string "meaning"
  end

  create_table "signs", force: :cascade do |t|
    t.string "name"
    t.string "element"
    t.string "quality"
    t.string "ruled_by"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
