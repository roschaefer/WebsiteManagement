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
