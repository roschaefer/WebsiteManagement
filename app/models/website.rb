class Website < ActiveRecord::Base
  attr_accessible :folder, :name, :user_id
  belongs_to :user
end
