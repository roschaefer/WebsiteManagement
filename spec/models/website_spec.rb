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
