class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
	  @user = User.find(params[:id])
	  @micropost = Micropost.new
    @microposts = @user.microposts.page(params[:page]).per(10)
    respond_to do |format|
			format.html 	
			format.js
		end
  end

end
