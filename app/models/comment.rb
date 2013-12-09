class Comment < ActiveRecord::Base
  attr_accessible :content, :down_vote_count, :flag_count, :up_vote_count
end
