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

ActiveRecord::Schema[7.0].define(version: 2022_07_23_130923) do
  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  create_table "service_days", force: :cascade do |t|
    t.date "date"
    t.datetime "start_hour"
    t.datetime "end_hour"
    t.boolean "available", default: true
    t.integer "service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_service_days_on_service_id"
  end

  create_table "service_hours", force: :cascade do |t|
    t.datetime "hour"
    t.boolean "available", default: true
    t.integer "service_day_id", null: false
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_service_hours_on_employee_id"
    t.index ["service_day_id"], name: "index_service_hours_on_service_day_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.json "settings_per_day"
    t.boolean "available", default: true
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_services_on_company_id"
  end

  add_foreign_key "employees", "companies"
  add_foreign_key "service_days", "services"
  add_foreign_key "service_hours", "employees"
  add_foreign_key "service_hours", "service_days"
  add_foreign_key "services", "companies"
end
