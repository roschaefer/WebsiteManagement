require 'spec_helper'

describe WebsitesController do
  describe "GET #show" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @website = FactoryGirl.create(:website, :user => @user, :folder => "onlyForTestPurposes")
      sign_in :user, @user
      @controller.stubs(:send_file)
      @cpath = HighVoltage.content_path
    end

    after(:each) do
      sign_out :user
      @user.destroy
      @website.destroy
    end

    it "doesn't redirect the user if authorized" do
      get :show, id: "#{@cpath}/onlyForTestPurposes/#{@cpath}index.html"
      response.should_not redirect_to new_user_session_path
    end

    it "redirects the user if not authorized" do
      sign_out :user
      get :show, id: "#{@cpath}/onlyForTestPurposes/#{@cpath}index.html"
      response.should redirect_to new_user_session_path
    end

    it "only replaces the HighVoltage.content_path at the start of the accessed path" do
      get :show, id: "#{@cpath}/onlyForTestPurposes/#{@cpath}index.html"
      @controller.instance_eval{current_page}.should match("#{@cpath*2}onlyForTestPurposes/#{@cpath}index.html")
    end
  end
end
