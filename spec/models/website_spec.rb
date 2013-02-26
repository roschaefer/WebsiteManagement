require 'spec_helper'

describe Website do
  before(:each) do
    @website = FactoryGirl.build(:website)
  end

  after(:each) do
    @website.destroy
  end

  it "should be valid with a name and a given folder" do
    @website.name    = "aWebsite"
    @website.folder  = "aFolder"
    @website.should be_valid
  end

end

describe "A website should in case of a file upload" do
  before(:each) do
    @website = FactoryGirl.create(:website_with_data, :folder => "")
  end

  after(:each) do
    @website.destroy
  end

  it "assign the uploaded filename to the folder, if the folder is blank" do
    @website.folder = ""
    @website.save
    @website.folder.should be_eql("testWebsite")
  end
  it "but leave the folder attribute as is, if it's provided" do
    @website.folder = "something"
    @website.save
    @website.folder.should be_eql("something")
  end
end



describe "The Website Model" do
  it "should yield all websites that contain a file name" do
    includedWebsites = [
      'certainFolder/',
      'certainFolder',
      'certainFolder/certainSubfolder/',
      'certainFolder/certainSubfolder/certainFile'
    ].collect { |folder| FactoryGirl.create(:website, :folder => folder)}
    excludedWebsites = [
      'certainFolder/certainSubfolder/certainFileA',
      'anotherFolder/certainSubfolder/certainFile',
      'a'
    ].collect { |folder| FactoryGirl.create(:website, :folder => folder)}

    Website.all.size.should be 7
    sites = Website.find_all_containing "certainFolder/certainSubfolder/certainFile"
    sites.size.should be 4
    sites.should eql(includedWebsites)
    sites.product(excludedWebsites).each {|pair| pair[0].should_not eql(pair[1])}
  end
end
