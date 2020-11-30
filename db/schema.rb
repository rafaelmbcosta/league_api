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

ActiveRecord::Schema.define(version: 2020_11_30_132347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "disputes", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "season_id", null: false
    t.boolean "finished", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_disputes_on_season_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "number", null: false
    t.boolean "golden", default: false, null: false
    t.bigint "season_id", null: false
    t.boolean "finished", default: false, null: false
    t.bigint "dispute_id"
    t.boolean "market_closed", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dispute_id"], name: "index_rounds_on_dispute_id"
    t.index ["season_id"], name: "index_rounds_on_season_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "round_id", null: false
    t.float "points", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["round_id"], name: "index_scores_on_round_id"
    t.index ["team_id"], name: "index_scores_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "year", null: false
    t.boolean "finished", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "key", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "active", default: true, null: false
    t.string "slug"
    t.string "url_escudo_png"
    t.string "id_tag"
    t.string "player_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "is_superadmin", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "disputes", "seasons"
  add_foreign_key "rounds", "disputes"
  add_foreign_key "rounds", "seasons"
  add_foreign_key "scores", "rounds"
  add_foreign_key "scores", "teams"
  add_foreign_key "sessions", "users"
end
