class AddFilesToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :files, :string
  end
end
