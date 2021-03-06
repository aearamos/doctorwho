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

ActiveRecord::Schema.define(version: 20170501152817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "doctors", force: :cascade do |t|
    t.string   "street_name"
    t.string   "city_name"
    t.string   "phone"
    t.text     "description"
    t.string   "crm"
    t.boolean  "activity"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "photo"
    t.string   "insurance"
    t.string   "website"
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "average_rating"
    t.index ["user_id"], name: "index_doctors_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "title"
    t.text     "comment"
    t.integer  "rating"
    t.date     "date_of_consultancy"
    t.integer  "user_id"
    t.integer  "doctor_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["doctor_id"], name: "index_reviews_on_doctor_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "specialties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatmentspecialties", force: :cascade do |t|
    t.integer  "doctor_id"
    t.integer  "specialty_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["doctor_id"], name: "index_treatmentspecialties_on_doctor_id", using: :btree
    t.index ["specialty_id"], name: "index_treatmentspecialties_on_specialty_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "doctorstatus",           default: "false"
    t.boolean  "admin",                  default: false,   null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "doctors", "users"
  add_foreign_key "reviews", "doctors"
  add_foreign_key "reviews", "users"
  add_foreign_key "treatmentspecialties", "doctors"
  add_foreign_key "treatmentspecialties", "specialties"
end
