json.extract! answer_comment, :id, :comment_by, :answer_id, :upvotes, :downvotes, :comment, :created_at, :updated_at
json.url answer_comment_url(answer_comment, format: :json)
