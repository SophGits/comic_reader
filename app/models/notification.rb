class Notification < ActiveRecord::Base
  attr_accessible :active

  belongs_to :user
  belongs_to :strip

end