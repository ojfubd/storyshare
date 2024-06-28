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

ActiveRecord::Schema[7.1].define(version: 2024_06_21_035713) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stories", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "cover", limit: 55
    t.integer "category", null: false
    t.string "theme", limit: 1000
    t.string "motif", limit: 4000
    t.string "memo", limit: 4000
    t.string "place", limit: 2000
    t.string "era", limit: 2000
    t.string "character", limit: 2000
    t.string "body", limit: 10000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "status", default: 0, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
