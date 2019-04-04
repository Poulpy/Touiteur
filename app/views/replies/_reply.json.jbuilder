json.extract! reply, :id, :parent_id, :child_id, :created_at, :updated_at
json.url reply_url(reply, format: :json)
