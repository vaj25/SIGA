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

ActiveRecord::Schema.define(version: 20180215212322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "tipo"
    t.text "descripcion"
    t.date "fecha_inicio"
    t.date "fecha_fin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "zone_id"
    t.index ["zone_id"], name: "index_activities_on_zone_id"
  end

  create_table "activity_contacts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contact_id"
    t.bigint "activity_id"
    t.index ["activity_id"], name: "index_activity_contacts_on_activity_id"
    t.index ["contact_id"], name: "index_activity_contacts_on_contact_id"
  end

  create_table "charges", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.decimal "concepto", precision: 8, scale: 2
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "activity_id"
    t.index ["activity_id"], name: "index_collections_on_activity_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.text "nombre"
    t.text "email"
    t.integer "celular"
    t.integer "fijo"
    t.text "organizacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detail_incomes", force: :cascade do |t|
    t.integer "cantidad"
    t.decimal "precio", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tree_id"
    t.index ["tree_id"], name: "index_detail_incomes_on_tree_id"
  end

  create_table "diaries", force: :cascade do |t|
    t.string "discusion"
    t.text "descripcion"
    t.text "acuerdo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "meeting_id"
    t.index ["meeting_id"], name: "index_diaries_on_meeting_id"
  end

  create_table "general_meetings", force: :cascade do |t|
    t.integer "num_asistentes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "activity_id"
    t.index ["activity_id"], name: "index_general_meetings_on_activity_id"
  end

  create_table "meeting_members", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "member_id"
    t.bigint "meeting_id"
    t.index ["meeting_id"], name: "index_meeting_members_on_meeting_id"
    t.index ["member_id"], name: "index_meeting_members_on_member_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "activity_id"
    t.index ["activity_id"], name: "index_meetings_on_activity_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "primer_nombre"
    t.string "segundo_nombre"
    t.string "primer_apellido"
    t.string "segundo_apellido"
    t.string "dui"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "charge_id"
    t.bigint "general_meeting_id"
    t.boolean "activo"
    t.index ["charge_id"], name: "index_members_on_charge_id"
    t.index ["general_meeting_id"], name: "index_members_on_general_meeting_id"
  end

  create_table "resource_activities", force: :cascade do |t|
    t.text "descripcion"
    t.decimal "precio", precision: 8, scale: 2, default: "0.0"
    t.integer "cantidad", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "activity_id"
    t.index ["activity_id"], name: "index_resource_activities_on_activity_id"
  end

  create_table "resource_activities_trees", force: :cascade do |t|
    t.integer "cantidad", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tree_id"
    t.bigint "resource_activity_id"
    t.decimal "precio", precision: 8, scale: 2, default: "0.0"
    t.index ["resource_activity_id"], name: "index_resource_activities_trees_on_resource_activity_id"
    t.index ["tree_id"], name: "index_resource_activities_trees_on_tree_id"
  end

  create_table "resources", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trees", force: :cascade do |t|
    t.string "nombre_comun"
    t.string "nombre_cientifico"
    t.text "observaciones"
    t.integer "cantidad", default: 0
    t.decimal "precio", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "administrator_rol", default: false
    t.boolean "executive_role", default: false
    t.boolean "subexecutive_role", default: false
    t.boolean "user_role", default: true
    t.string "username"
    t.string "lastname"
    t.boolean "is_active", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "zones", force: :cascade do |t|
    t.string "nombre"
    t.decimal "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activities", "zones"
  add_foreign_key "activity_contacts", "activities"
  add_foreign_key "activity_contacts", "contacts"
  add_foreign_key "collections", "activities"
  add_foreign_key "detail_incomes", "trees"
  add_foreign_key "diaries", "meetings"
  add_foreign_key "general_meetings", "activities"
  add_foreign_key "meeting_members", "meetings"
  add_foreign_key "meeting_members", "members"
  add_foreign_key "meetings", "activities"
  add_foreign_key "members", "charges"
  add_foreign_key "members", "general_meetings"
  add_foreign_key "resource_activities", "activities"
  add_foreign_key "resource_activities_trees", "resource_activities"
  add_foreign_key "resource_activities_trees", "trees"
end
