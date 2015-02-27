class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content)
  end
end
