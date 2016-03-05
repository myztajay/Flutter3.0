class PagesController < ApplicationController
  def index
  end

  def home
    @posts = Post.all
    @newPost = Post.new
  end

  def profile
    #grab username from URL
   if (User.find_by_username(params[:id]))
    @username = params[:id]
  else
    #404 redirect
    redirect_to root_path, :notice=> 'User not found!'
   end 
   
   @tofollow = User.all
   @posts = Post.all.where('user_id = ?', User.find_by_username(params[:id]).id)
   @newPost = Post.new
  end
  
  def explore
    @posts = Post.all
  end
end
