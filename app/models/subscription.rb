class Subscription < ActiveRecord::Base
  attr_accessible :feed_url_id, :user_id

  belongs_to :user
  has_many :feeds
end
