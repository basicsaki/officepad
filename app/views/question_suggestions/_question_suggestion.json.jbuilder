json.extract! question_suggestion, :id, :suggestion_by, :text, :upvotes, :downvotes, :created_at, :updated_at
json.url question_suggestion_url(question_suggestion, format: :json)
