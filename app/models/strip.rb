class Strip < ActiveRecord::Base
  attr_accessible :down_vote_count, :flag_count, :keywords, :strip_url, :up_vote_count, :feed_id #feed_id okay?

  belongs_to :feed
  has_many :comments
  has_many :notifications
  has_many :users, through: :notifications

  # acts_as_votable

  # accepts_nested_attributes_for :comments

end
