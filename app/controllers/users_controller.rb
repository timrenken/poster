class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def show
    @posts = @user.posts.paginate(page: params[:page])
  end
  
  def index
    @users = User.paginate(page: params[:page]).order(:username)
  end
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  private
  
  def set_user
    @user = User.find_by(username: params[:id])
  end
end
