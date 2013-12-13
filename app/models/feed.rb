include ParserHelper

class Feed < ActiveRecord::Base
  attr_accessible :author, :title, :down_vote_count, :logo, :feed_url, :flag_count, :keywords, :main_url, :summary, :up_vote_count, :feed_type

  has_many :comments
  has_many :strips, :dependent => :destroy
  has_many :subscriptions
  has_many :users, through: :subscriptions

  after_create do
    if self.feed_type == "explosm"
      parser = ExplosmFeedParser.new
      parser.get_strips(self)
    elsif self.feed_type == "dilbert"
      parser = DilbertFeedParser.new
    end
  end
end
