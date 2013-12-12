class Strip < ActiveRecord::Base
  attr_accessible :down_vote_count, :flag_count, :keywords, :strip_url, :up_vote_count, :created_at, :updated_at, :feed_id #feed_id okay?

  belongs_to :feed
  has_many :comments

  # accepts_nested_attributes_for :comments

end
