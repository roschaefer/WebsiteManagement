class UsersController < ApplicationController
before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])

    if @user.role? :admin
      @websites = Website.all
    elsif @user.role? :client
      @websites = @user.websites
    else
      @websites = []
    end
  end

end
