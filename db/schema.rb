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

ActiveRecord::Schema[7.1].define(version: 2023_11_19_181855) do
  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.bigint "travel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "key"
    t.index ["travel_id"], name: "index_articles_on_travel_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "articles_contacts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "contact_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_articles_contacts_on_article_id"
    t.index ["contact_id"], name: "index_articles_contacts_on_contact_id"
  end

  create_table "articles_diseases", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "disease_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
    t.index ["article_id"], name: "index_articles_diseases_on_article_id"
    t.index ["disease_id"], name: "index_articles_diseases_on_disease_id"
  end

  create_table "articles_medicaments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "medicament_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "quantity"
    t.index ["article_id"], name: "index_articles_medicaments_on_article_id"
    t.index ["medicament_id"], name: "index_articles_medicaments_on_medicament_id"
  end

  create_table "bloodtypes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.integer "phone"
    t.bigint "user_id", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_contacts_on_country_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "countries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "alpha3_code"
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_countries_on_language_id"
  end

  create_table "destinies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "start_date"
    t.date "fishis_date"
    t.bigint "country_id", null: false
    t.bigint "travel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_destinies_on_country_id"
    t.index ["travel_id"], name: "index_destinies_on_travel_id"
  end

  create_table "diseases", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicaments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "compound"
    t.bigint "unit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_medicaments_on_unit_id"
  end

  create_table "travels", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "finish_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["user_id"], name: "index_travels_on_user_id"
  end

  create_table "units", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "s_name"
    t.string "lastname"
    t.string "s_lastname"
    t.string "rut"
    t.string "passport"
    t.bigint "country_id"
    t.bigint "bloodtype_id"
    t.bigint "usertype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bloodtype_id"], name: "index_users_on_bloodtype_id"
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["passport"], name: "index_users_on_passport", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["rut"], name: "index_users_on_rut", unique: true
    t.index ["usertype_id"], name: "index_users_on_usertype_id"
  end

  create_table "usertypes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "articles", "travels"
  add_foreign_key "articles", "users"
  add_foreign_key "articles_contacts", "articles"
  add_foreign_key "articles_contacts", "contacts"
  add_foreign_key "articles_diseases", "articles"
  add_foreign_key "articles_diseases", "diseases"
  add_foreign_key "articles_medicaments", "articles"
  add_foreign_key "articles_medicaments", "medicaments"
  add_foreign_key "contacts", "countries"
  add_foreign_key "contacts", "users"
  add_foreign_key "countries", "languages"
  add_foreign_key "destinies", "countries"
  add_foreign_key "destinies", "travels"
  add_foreign_key "medicaments", "units"
  add_foreign_key "travels", "users"
end
