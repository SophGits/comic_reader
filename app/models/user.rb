class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :comments
  has_many :subscriptions
  has_many :feeds, through: :subscriptions

  attr_accessible :username, :role, :created_at, :avatar

#see messages_controller
  # def messages_with_user other_user_id
  #   sent     = self.messages_sent.where("recipient_id = ?", other_user_id)
  #   received = self.messages_received.where("sender_id = ?", other_user_id)
  #   [sent, received].flatten.sort_by(&:created_at)
  # end

  # def contact_list
  #   User.find_all_by_id [users_contacted, users_contacted_by]
  # end

end
