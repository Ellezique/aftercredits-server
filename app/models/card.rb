class Card < ApplicationRecord
  has_many :messages
  validates_presence_of :imdb_id
end
