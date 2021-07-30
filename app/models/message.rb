class Message < ApplicationRecord
  belongs_to :user
  belongs_to :card

  # This method will find all if a user's messages by their username
   def self.find_by_user(username)
    user = User.find_by(username: username) #we can also say user=User.id
    return self.where(user: user)
  end

  #transforms a single message to this format:
  def transform_message
    return {
      id: self.id, #this is the message id
      text: self.m_text,
      card: self.card.imdb_id, #the message belongs to a card with an imdb_id
      username: self.user.username,
      posted: self.updated_at
    }
  end
end



