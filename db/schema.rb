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

ActiveRecord::Schema.define(version: 2021_02_03_233821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.integer "library_id"
    t.string "title"
    t.boolean "audio_book"
    t.integer "copies_available"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "characters", force: :cascade do |t|
    t.integer "novel_id"
    t.string "name"
    t.boolean "antagonist"
    t.integer "age"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.boolean "online_membership"
    t.integer "current_employees"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "novels", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.boolean "hard_cover"
    t.integer "number_of_chapters"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
