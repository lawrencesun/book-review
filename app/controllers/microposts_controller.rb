class MicropostsController < ApplicationController

	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:notice] = "Successfully Posted."
			redirect_to user_path(current_user)
		else
			flash[:error] = "Somethins's wrong."
			render user_path(current_user)
		end
	end

	def edit		
	end

	def update
		if @micropost.update(micropost_params)
			flash[:success] = "Updated."
			redirect_to user_path(current_user)
		else 
			render 'edit'
		end
	end

	def destroy
		@micropost.destroy
		flash[:success] = "Deleted"
		redirect_to @user
	end

	private
		def micropost_params
			params.require(:micropost).permit!
		end
end