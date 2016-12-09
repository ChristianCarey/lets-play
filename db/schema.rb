ActiveRecord::Schema.define(version: 20161209034913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendings_on_event_id", using: :btree
    t.index ["user_id"], name: "index_attendings_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.datetime "datetime"
    t.integer  "min_players"
    t.integer  "max_players"
    t.integer  "game_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "host_id"
    t.index ["game_id"], name: "index_events_on_game_id", using: :btree
    t.index ["host_id"], name: "index_events_on_host_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "thumb_url"
    t.string   "image_url"
    t.string   "category"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "hostings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_hostings_on_event_id", using: :btree
    t.index ["user_id"], name: "index_hostings_on_user_id", using: :btree
  end

  create_table "ownerships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_ownerships_on_game_id", using: :btree
    t.index ["user_id"], name: "index_ownerships_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "attendings", "events"
  add_foreign_key "attendings", "users"
  add_foreign_key "events", "games"
  add_foreign_key "hostings", "events"
  add_foreign_key "hostings", "users"
  add_foreign_key "ownerships", "games"
  add_foreign_key "ownerships", "users"
end
