json.extract! notice_board, :id, :user_id, :name, :description, :created_at, :updated_at
json.url notice_board_url(notice_board, format: :json)
