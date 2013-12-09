class Feed < ActiveRecord::Base
  attr_accessible :author, :down_vote_count, :feed_logo, :feed_url, :flag_count, :keywords, :main_url, :summary, :up_vote_count

  has_many :comments
  has_many :strips, :dependent => :destroy
  has_many :subscriptions
  has_many :users, through: :subscriptions
end
