class Comment < ActiveRecord::Base
  attr_accessible :content, :down_vote_count, :flag_count, :up_vote_count
#:strip_id

  belongs_to :user
  belongs_to :strip

end
