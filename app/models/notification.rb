class Notification < ActiveRecord::Base
  attr_accessible :active

  belongs_to :user
  belongs_to :strip
  belongs_to :feed

  validates_uniqueness_of :user_id, :scope => [:strip_id]
end

