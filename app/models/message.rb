class Message < ActiveRecord::Base
  attr_accessible :content, :is_read, :recipient_id, :sender_id

  belongs_to :user
end
