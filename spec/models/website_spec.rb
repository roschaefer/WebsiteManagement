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
    @website = FactoryGirl.create(:website, :folder => "testWebsite")
  end

  after(:each) do
    @website.destroy
  end

  it "leave the folder attribute as is, if it's provided" do
    @website.folder = "something"
    @website.save
    @website.folder.should eql("something")
  end
  it "should ensure, that no other files will be overwritten" do
    @anotherWebsite = FactoryGirl.build(:website, :folder => "testWebsite")
    @anotherWebsite.should_not be_valid
    expect {@anotherWebsite.save!}.to raise_error{ActiveRecord::RecordInvalid}
  end
  it "should clean all associated files if the website is deleted" do
      FileUtils.expects(:rm_rf).with(Rails.root.join('app','views', HighVoltage.content_path, @website.folder).to_s)
      # will be called in after hook @website.destroy
  end
end

describe "If the folder of a website" do
  it "was not assigned, it should be taken from the uploaded file's name" do
    @yetAnotherWebsite = FactoryGirl.create(:website, :folder => "")
    @yetAnotherWebsite.save
    @yetAnotherWebsite.folder.should eql("testWebsite")
    @yetAnotherWebsite.destroy
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
