class Website < ActiveRecord::Base
  attr_accessible :folder, :name, :user_id
  belongs_to :user

  validates :folder, :name, :presence => true

  def self.find_all_containing(collection = Website.all, filename)
      collection.find_all {|site| filename.start_with? site.folder}
  end

  def root_link
    "#{folder}/index.html"
  end
end
