class Website < ActiveRecord::Base
  attr_accessible :folder, :name, :files, :user_id
  belongs_to :user
  mount_uploader :files, FilesUploader

  validates_presence_of :name
  validates_presence_of :files, :on => :create
  validates :folder , :uniqueness => true

  before_validation(:on => :create) do
    assign_filesname_to_folder
  end
  before_destroy :remove_folder

  def assign_filesname_to_folder
    if folder.blank? and not files.blank?
      self[:folder] = File.basename(files.path, ".*")
    end
  end

  def remove_folder
    logger.debug "Removing folder!"
    FileUtils.rm_rf(absolute_folder_path)
  end

  def absolute_folder_path
    Rails.root.join('app','views', HighVoltage.content_path, folder).to_s
  end

  def self.find_all_containing(collection = Website.all, filename)
      collection.find_all {|site| filename.start_with? site.folder}
  end

  def root_link
    "#{folder}/index.html"
  end


end
