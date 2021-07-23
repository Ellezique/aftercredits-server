json.extract! card, :id, :imdb_id, :created_at, :updated_at
json.url card_url(card, format: :json)
