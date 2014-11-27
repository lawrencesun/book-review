class PostsController < ApplicationController
	before_filter :load_postable
	before_action :find_post, only:[:edit, :update, :destroy]
	before_filter :authenticate_user!
	
	def index
	end

	def show
		redirect_to @postable
	end

	def new
	end

	def create
		@post = @postable.posts.build(post_params)
		@post.user = current_user
		if @post.save
			flash[:notice] = "Successfully Posted."
			redirect_to @postable
		else
			redirect_to @postable
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:notice] = "Updated."
			redirect_to @postable
		else 
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		flash[:notice] = "Deleted."
		redirect_to @postable
	end

	private
		def load_postable
    	resource, id = request.path.split('/')[1, 2]
    	@postable = resource.singularize.classify.constantize.find(id)
  	end

		def find_post
			@post = @postable.posts.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:body)
		end
end