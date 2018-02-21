json.extract! suggestion, :id, :user_id, :name, :text, :created_at, :updated_at
json.url suggestion_url(suggestion, format: :json)
