class Website < ActiveRecord::Base
  attr_accessible :folder, :name
  belongs_to :user
end
