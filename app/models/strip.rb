class Strip < ActiveRecord::Base
  attr_accessible :down_vote_count, :flag_count, :keywords, :strip_url, :up_vote_count
end
