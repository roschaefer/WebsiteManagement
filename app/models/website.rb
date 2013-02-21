class Website < ActiveRecord::Base
  attr_accessible :folder, :name, :user_id
  belongs_to :user

  validates :user_id, :folder, :name, :presence => true

  def self.find_all_containing(collection = Website.all, filename)
      collection.find_all {|site| filename.start_with? site.folder}
  end
end
