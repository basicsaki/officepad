json.extract! comment, :id, :comment_by, :suggestion_id, :text, :created_at, :updated_at
json.url comment_url(comment, format: :json)
