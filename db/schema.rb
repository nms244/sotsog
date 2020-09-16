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

ActiveRecord::Schema.define(version: 2020_09_15_162312) do

  create_table "messages", force: :cascade do |t|
    t.integer "room_id", null: false
    t.boolean "is_student"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["room_id"], name: "index_messages_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_rooms_on_student_id"
    t.index ["teacher_id"], name: "index_rooms_on_teacher_id"
  end

  create_table "student_followings", force: :cascade do |t|
    t.integer "follow_id"
    t.integer "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follow_id", "followed_id"], name: "index_student_followings_on_follow_id_and_followed_id", unique: true
    t.index ["follow_id"], name: "index_student_followings_on_follow_id"
    t.index ["followed_id"], name: "index_student_followings_on_followed_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "icon"
    t.text "profile"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "teacher_followings", force: :cascade do |t|
    t.integer "follow_id"
    t.integer "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follow_id", "followed_id"], name: "index_teacher_followings_on_follow_id_and_followed_id", unique: true
    t.index ["follow_id"], name: "index_teacher_followings_on_follow_id"
    t.index ["followed_id"], name: "index_teacher_followings_on_followed_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "icon"
    t.text "profile"
    t.text "subject"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "rooms"
  add_foreign_key "rooms", "students"
  add_foreign_key "rooms", "teachers"
  add_foreign_key "student_followings", "students", column: "follow_id"
  add_foreign_key "student_followings", "teachers", column: "followed_id"
  add_foreign_key "teacher_followings", "students", column: "followed_id"
  add_foreign_key "teacher_followings", "teachers", column: "follow_id"
end
