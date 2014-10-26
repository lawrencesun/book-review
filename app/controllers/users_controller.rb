class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
	  @user = User.find(params[:id])
	  @micropost = Micropost.new
    @microposts = @user.microposts.page(params[:page]).per(5)
    @comments = @user.comments.order('created_at DESC').page(params[:page]).per(10)
    respond_to do |format|
			format.html 	
			format.js
		end
  end

 	def following
    @user = User.find(params[:id])
    @users = @user.followed_users.page(params[:page]).per(10)
    render 'show_follow'
	end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(10)
    render 'show_follow'
	end

end
