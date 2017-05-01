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

ActiveRecord::Schema.define(version: 20170501065618) do

  create_table "cp_managers", force: :cascade do |t|
    t.string   "name"
    t.string   "manager_image"
    t.string   "post"
    t.text     "description"
    t.string   "website"
    t.integer  "job_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "cp_photos", force: :cascade do |t|
    t.integer  "job_id"
    t.string   "cp_in_image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cp_products", force: :cascade do |t|
    t.string   "product_image"
    t.string   "title"
    t.text     "description"
    t.integer  "job_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "product_link"
  end

  create_table "jb_labels", force: :cascade do |t|
    t.integer  "job_id"
    t.string   "label_item"
    t.boolean  "is_of_product", default: false
    t.boolean  "is_of_company", default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "job_relationships", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "department"
    t.string   "wage_upper_bound"
    t.string   "wage_lower_bound"
    t.boolean  "is_fulltime",      default: true
    t.text     "temptation"
    t.text     "task"
    t.text     "claim"
    t.boolean  "is_show",          default: false
    t.string   "cp_image"
    t.string   "cp_name"
    t.string   "cp_subtitle"
    t.integer  "quantity"
    t.string   "cp_type"
    t.string   "cp_stage"
    t.string   "cp_number"
    t.string   "cp_city"
    t.text     "cp_description"
    t.string   "cp_lng"
    t.string   "cp_lat"
    t.string   "cp_website"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
  end

  create_table "mycollects", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.integer  "resume_id"
    t.boolean  "is_of_job",  default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "resume_id"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_labels", force: :cascade do |t|
    t.integer  "cp_product_id"
    t.string   "label_item"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "resume_relationships", force: :cascade do |t|
    t.integer  "resume_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resumes", force: :cascade do |t|
    t.string   "semester"
    t.string   "work_place"
    t.integer  "user_id"
    t.text     "description"
    t.string   "app_image"
    t.string   "logdown"
    t.string   "fs_username"
    t.string   "contact_email"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "name"
    t.boolean  "is_show",       default: false
    t.text     "introduction"
    t.string   "fs_link"
    t.string   "wmf"
    t.string   "wms"
    t.string   "wmf_link"
    t.string   "wms_link"
    t.string   "wms_git"
    t.string   "wmf_git"
    t.string   "wechatimg"
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "resume_id"
    t.string   "re_tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.string   "aavatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
