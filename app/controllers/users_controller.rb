class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @websites = @user.websites
  end
end
