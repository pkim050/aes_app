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

ActiveRecord::Schema.define(version: 20210920043016) do

  create_table "answers", force: :cascade do |t|
    t.string "answer_1_text"
    t.string "answer_2_text"
    t.string "answer_3_text"
    t.string "answer_4_text"
    t.string "answer_5_text"
    t.string "answer_6_text"
    t.string "answer_7_text"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment_text"
    t.integer "question_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
    t.index ["question_id"], name: "index_comments_on_question_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question_text"
    t.boolean "answer_1"
    t.boolean "answer_2"
    t.boolean "answer_3"
    t.boolean "answer_4"
    t.boolean "answer_5"
    t.boolean "answer_6"
    t.boolean "answer_7"
    t.text "answers"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "assigned"
    t.string "answer_1_text"
    t.string "answer_2_text"
    t.string "answer_3_text"
    t.string "answer_4_text"
    t.string "answer_5_text"
    t.string "answer_6_text"
    t.string "answer_7_text"
    t.boolean "ready", default: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "password_digest"
    t.boolean "etd"
    t.boolean "sme"
    t.boolean "editor"
    t.boolean "tester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
