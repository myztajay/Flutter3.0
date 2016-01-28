class PagesController < ApplicationController
  def index
  end

  def home
  end

  def profile
    #grab username from URL
   if (User.find_by_username(params[:id]))
    @username = params[:id]
  else
    #404 redirect
    redirect_to root_path, :notice=> 'User not found!'
   end 
  end

  def explore
  end
end
