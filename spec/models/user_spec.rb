require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new
  end

  it "should be valid with a name, email and password" do
    @user.name                  = "Fred"
    @user.email                 = "fred@example.com"
    @user.password              = "secret1234"
    @user.password_confirmation = "secret1234"
    @user.should be_valid
  end
end
