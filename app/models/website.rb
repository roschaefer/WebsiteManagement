class Website < ActiveRecord::Base
  attr_accessible :folder, :name, :user_id
  belongs_to :user

  validates :user_id, :folder, :name, :presence => true
end
