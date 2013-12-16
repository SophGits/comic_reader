class Subscription < ActiveRecord::Base
  attr_accessible :active

  belongs_to :user
  belongs_to :feed

  def self.is_subscribed? user_id, feed_id
    subscription = Subscription.where(user_id: user_id, feed_id: feed_id, active: true).first

    if subscription.nil?
      return false
    else
      return true
    end
  end
end
