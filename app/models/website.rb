class Website < ActiveRecord::Base
  attr_accessible :folder, :name, :files, :user_id
  belongs_to :user
  mount_uploader :files, FilesUploader

  validates_presence_of :name
  before_save :assign_filesname_to_folder

  def assign_filesname_to_folder
    if folder.blank?
      self[:folder] = File.basename(files.path, ".*")
    end
  end

  def self.find_all_containing(collection = Website.all, filename)
      collection.find_all {|site| filename.start_with? site.folder}
  end

  def root_link
    "#{folder}/index.html"
  end


end
