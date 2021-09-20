json.extract! comment, :id, :comment_text, :question_id, :user_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
