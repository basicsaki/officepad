json.extract! answer, :id, :answered_by, :question_id, :upvotes, :downvotes, :created_at, :updated_at
json.url answer_url(answer, format: :json)
