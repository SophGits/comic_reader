class Feed < ActiveRecord::Base
  attr_accessible :author, :down_vote_count, :feed_logo, :feed_url, :flag_count, :keywords, :main_url, :summary, :up_vote_count
end
