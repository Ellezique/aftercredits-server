class Message < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :card, required: true
  validates_presence_of :m_text

  # This method will find all of a user's messages by their username
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

  #create method for index and my_messages in messages controller for:
  # .each do |msg| 
  #   @messages << Message.find_by(id: msg.id).transform_message
  
end



