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

ActiveRecord::Schema.define(version: 20170105230506) do

  create_table "ebooks", force: :cascade do |t|
    t.string   "title"
    t.string   "titles"
    t.string   "languages"
    t.string   "contributors"
    t.string   "coverages"
    t.string   "creators"
    t.string   "dates"
    t.string   "descriptions"
    t.string   "formats"
    t.string   "publishers"
    t.string   "relations"
    t.string   "rights"
    t.string   "sources"
    t.string   "subjects"
    t.string   "types"
    t.string   "uniqueid"
    t.string   "epubver"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "book_file_name"
    t.string   "book_content_type"
    t.integer  "book_file_size"
    t.datetime "book_updated_at"
  end

end
