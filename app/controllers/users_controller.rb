class UsersController < ApplicationController
  def index
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find_by_username(params[:id])
    @posts = @user.posts
  end
end
