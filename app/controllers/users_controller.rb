class UsersController < ApplicationController
load_and_authorize_resource

  def show
    @user = User.find(params[:id])

    if @user.role? :admin
      @websites = Website.all
    elsif @user.role? :client
      @websites = @user.websites
      if @websites.size == 1 then redirect_to website_path(@websites.first.root_link) end
    else
      @websites = []
    end
  end

end
