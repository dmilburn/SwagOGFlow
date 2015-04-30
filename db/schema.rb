ActiveRecord::Schema.define(version: 20150430211223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "body",                        null: false
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "selected",    default: false
  end

  create_table "question_tags", force: :cascade do |t|
    t.integer  "question_id", null: false
    t.integer  "tag_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title",                      null: false
    t.text     "body",                       null: false
    t.boolean  "answered",   default: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: :cascade do |t|
    t.text     "body",             null: false
    t.integer  "user_id"
    t.integer  "respondable_id"
    t.string   "respondable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "value",        null: false
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
