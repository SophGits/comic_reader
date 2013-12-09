class Comment < ActiveRecord::Base
  attr_accessible :content, :down_vote_count, :flag_count, :up_vote_count

  belongs_to :user
  belongs_to :strip

end
