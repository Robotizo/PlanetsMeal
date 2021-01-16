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

ActiveRecord::Schema.define(version: 20181006235818) do

  create_table "boxes", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
    t.decimal  "box_price",  precision: 10, scale: 2
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "order_status"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price",       precision: 8,  scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "image"
    t.decimal  "calories",    precision: 10, scale: 2
    t.decimal  "proteins",    precision: 10, scale: 2
    t.decimal  "carbs",       precision: 10, scale: 2
    t.decimal  "water",       precision: 10, scale: 2
    t.decimal  "land",        precision: 10, scale: 2
    t.decimal  "carbon",      precision: 10, scale: 2
    t.decimal  "lives",       precision: 10, scale: 2
    t.string   "store_type"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "email"
    t.string   "password_digest"
    t.decimal  "user_calories",   precision: 10, scale: 2
    t.decimal  "user_proteins",   precision: 10, scale: 2
    t.decimal  "user_carbs",      precision: 10, scale: 2
    t.decimal  "user_water",      precision: 10, scale: 2
    t.decimal  "user_land",       precision: 10, scale: 2
    t.decimal  "user_carbon",     precision: 10, scale: 2
    t.decimal  "user_lives",      precision: 10, scale: 2
    t.boolean  "admin",                                    default: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
