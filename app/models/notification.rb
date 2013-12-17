class Notification < ActiveRecord::Base
  attr_accessible :active

  belongs_to :user
  belongs_to :strip

  validates_uniqueness_of :user_id, :scope => [:feed_id]
end

