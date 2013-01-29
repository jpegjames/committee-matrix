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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130129173328) do

  create_table "applicant_files", :force => true do |t|
    t.integer  "applicant_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  add_index "applicant_files", ["applicant_id"], :name => "index_applicant_files_on_applicant_id"

  create_table "applicants", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.date     "date_applied"
    t.datetime "created_at",                                                           :null => false
    t.datetime "updated_at",                                                           :null => false
    t.decimal  "average_score",           :precision => 6, :scale => 5
    t.decimal  "average_score_sort",      :precision => 3, :scale => 2
    t.decimal  "average_score_precision", :precision => 4, :scale => 3
    t.integer  "skype_vote_total"
    t.integer  "skype_list",                                            :default => 2
    t.datetime "skype_date"
  end

  create_table "member_responses", :force => true do |t|
    t.integer  "q1a"
    t.text     "q1c"
    t.integer  "q2a"
    t.text     "q2c"
    t.integer  "q3a"
    t.text     "q3c"
    t.integer  "q4a"
    t.text     "q4c"
    t.integer  "q5a"
    t.text     "q5c"
    t.integer  "q6a"
    t.text     "q6c"
    t.integer  "q7a"
    t.text     "q7c"
    t.integer  "q8a"
    t.text     "q8c"
    t.integer  "q9a"
    t.text     "q9c"
    t.integer  "q10a"
    t.text     "q10c"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.integer  "applicant_id"
    t.integer  "member_id"
    t.text     "general_comments"
    t.decimal  "score",            :precision => 5, :scale => 4
    t.boolean  "skype_vote"
    t.text     "skype_comments"
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
