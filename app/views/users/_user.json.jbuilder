json.extract! user, :id, :username, :password, :password_digest, :etd, :sme, :editor, :tester, :created_at, :updated_at
json.url user_url(user, format: :json)
