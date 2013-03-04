require 'spec_helper'

describe UsersController do
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
      @anotherwebsite.destroy unless @anotherwebsite.nil?
    end

    it "populates an array of websites for the user" do
      get :show, id: @user
      assigns(:websites).should eq([@website])
    end
    it "populates an array of all websites for an admin" do
      @user.role= 'admin'; @user.save!
      @anotherwebsite = FactoryGirl.create(:website, :user => nil, :folder => "anyOtherFolder")
      get :show, id: @user
      assigns(:websites).should eq([@website, @anotherwebsite])
    end
  end
end
