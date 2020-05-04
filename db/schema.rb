# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_04_044438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "scavvie_skills", force: :cascade do |t|
    t.bigint "scavvie_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["scavvie_id"], name: "index_scavvie_skills_on_scavvie_id"
    t.index ["skill_id"], name: "index_scavvie_skills_on_skill_id"
  end

  create_table "scavvies", force: :cascade do |t|
    t.string "name"
    t.string "pronouns"
    t.string "email"
    t.string "phone"
    t.string "location"
    t.text "skill_description"
    t.text "czar_interest"
    t.string "yearbook_quote"
    t.text "about"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_url"
    t.string "software"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "scavvie_skills", "scavvies"
  add_foreign_key "scavvie_skills", "skills"
end
