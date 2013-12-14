class Message < ActiveRecord::Base
  attr_accessible :content, :is_read, :recipient_id, :sender_id
  attr_accessor :recipient_username, :sender_username

   validates :content, presence: true #doesn't do much

end
