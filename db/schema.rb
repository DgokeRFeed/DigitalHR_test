# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_01_20_161210) do
  create_table "interests", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "patronymic", null: false
    t.string "full_name", null: false
    t.string "email", null: false
    t.integer "age", null: false
    t.string "nationality", null: false
    t.string "country", null: false
    t.string "gender", null: false
  end

  create_table "users_interests", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "interest_id"
    t.index ["interest_id"], name: "index_users_interests_on_interest_id"
    t.index ["user_id"], name: "index_users_interests_on_user_id"
  end

  create_table "users_skills", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "skill_id"
    t.index ["skill_id"], name: "index_users_skills_on_skill_id"
    t.index ["user_id"], name: "index_users_skills_on_user_id"
  end
end
