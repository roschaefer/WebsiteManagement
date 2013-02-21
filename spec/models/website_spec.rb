require 'spec_helper'

describe Website do
  before(:all) do
    @website = Website.new
    @user    = FactoryGirl.build(:user, :id => 1)
  end

  it "should not be valid without a user" do
    @website.user_id = nil
    @website.should_not be_valid
  end

  it "should be valid with a user and a given folder" do
    @website.user_id = @user.id
    @website.name    = "aWebsite"
    @website.folder  = "aFolder"
    @website.should be_valid
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
