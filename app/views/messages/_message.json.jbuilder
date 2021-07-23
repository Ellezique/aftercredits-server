json.extract! message, :id, :m_text, :user_id, :card_id, :created_at, :updated_at
json.url message_url(message, format: :json)
