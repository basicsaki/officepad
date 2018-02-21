json.extract! question, :id, :name, :description, :asked_by, :upvotes, :downvotes, :created_at, :updated_at
json.url question_url(question, format: :json)
