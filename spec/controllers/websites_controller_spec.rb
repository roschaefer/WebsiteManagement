require 'spec_helper'

describe WebsitesController do
  describe "GET #show" do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @website = FactoryGirl.create(:website, :user => @user)
    sign_in :user, @user
  end

  after(:each) do
    sign_out :user
    @user.destroy
    @website.destroy
  end

  it "sends files in the browser if the user is authorized"
  it "only replaces the HighVoltage.content_path at the start of the accessed path"
  end
end
