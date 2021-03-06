# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140122170213) do

  create_table "customers", force: true do |t|
    t.string   "nif"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["nif"], name: "index_customers_on_nif", unique: true

  create_table "distributions", force: true do |t|
    t.string   "concept",                                   null: false
    t.decimal  "amount",            precision: 5, scale: 2, null: false
    t.string   "status",                                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payment_id"
    t.integer  "project_worker_id"
  end

  add_index "distributions", ["payment_id"], name: "index_distributions_on_payment_id"
  add_index "distributions", ["project_worker_id"], name: "index_distributions_on_project_worker_id"

  create_table "employees", force: true do |t|
    t.string   "email",          null: false
    t.string   "identification", null: false
    t.string   "name",           null: false
    t.string   "last_name",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.date     "expiration_date",                              null: false
    t.date     "cancellation_date"
    t.string   "invoice_number"
    t.decimal  "amount",               precision: 5, scale: 2, null: false
    t.decimal  "distributable_amount", precision: 5, scale: 2, null: false
    t.string   "status",                                       null: false
    t.string   "origin",                                       null: false
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  add_index "payments", ["project_id"], name: "index_payments_on_project_id"

  create_table "project_workers", force: true do |t|
    t.string   "role"
    t.decimal  "hour_rate",   precision: 5, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "employee_id"
  end

  add_index "project_workers", ["employee_id"], name: "index_project_workers_on_employee_id"
  add_index "project_workers", ["project_id"], name: "index_project_workers_on_project_id"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "state",       default: "proposal", null: false
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id",                      null: false
    t.string   "work_mode"
    t.decimal  "value"
    t.decimal  "hour_rate"
  end

  add_index "projects", ["customer_id"], name: "index_projects_on_customer_id"

  create_table "time_sheets", force: true do |t|
    t.date     "date",                                      null: false
    t.time     "start_time",                                null: false
    t.time     "end_time",                                  null: false
    t.text     "work_description",                          null: false
    t.text     "notes"
    t.integer  "hours",                                     null: false
    t.decimal  "hour_rate",         precision: 5, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_worker_id"
  end

  add_index "time_sheets", ["project_worker_id"], name: "index_time_sheets_on_project_worker_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
