include ParserHelper

class Feed < ActiveRecord::Base
  attr_accessible :author, :title, :down_vote_count, :logo, :feed_url, :flag_count, :keywords, :main_url, :summary, :up_vote_count, :feed_type


  has_many :comments
  has_many :strips, :dependent => :destroy
  has_many :subscriptions
  has_many :users, through: :subscriptions


  def set_notifications_as_unactive user_id
    notifications = Notification.where(feed_id: self.id, user_id: user_id, active: true)

    notifications.each do |notification|
      notification.active = false
      notification.save
    end
  end
end
