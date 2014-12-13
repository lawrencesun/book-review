class MicropostsController < ApplicationController
	before_action :find_micropost, only:[:edit, :update, :destroy]
	before_filter :authenticate_user!, except:[:show, :index]

	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:notice] = "Successfully Posted."
			redirect_to user_path(current_user)
		else
			flash[:error] = "Somethins's wrong."
			redirect_to user_path(current_user)
		end
	end

	def edit		
	end

	def update
		if @micropost.update(micropost_params)
			flash[:notice] = "Updated."
			redirect_to user_path(current_user)
		else 
			render 'edit'
		end
	end

	def destroy
		@micropost.destroy
		flash[:success] = "Deleted."
		redirect_to user_path(current_user)
	end

	private
		def micropost_params
			params.require(:micropost).permit!
		end

		def find_micropost
			@micropost = Micropost.find(params[:id])
		end
end