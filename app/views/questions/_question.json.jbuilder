json.extract! question, :id, :question_text, :answer_1, :answer_2, :answer_3, :answer_4, :answer_5, :answer_6, :answer_7, :answers, :comments, :created_at, :updated_at
json.url question_url(question, format: :json)
