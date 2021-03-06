class PostsController < ApplicationController
	before_filter :load_postable, only:[:new, :create]
	before_action :find_post, only:[:edit, :update, :destroy, :show]
	before_filter :authenticate_user!, except:[:show, :index]
	
	def index
	end

	def show
		@comment = Comment.new
		@commentable = @post
		@comments = @commentable.comments.page(params[:page]).per(10)
		respond_to do |format|
			format.html
			format.js
		end
	end

	def new
		@post = Post.new
	end

	def create
		@post = @postable.posts.build(post_params)
		@post.user = current_user
		if @post.save
			flash[:notice] = "Successfully Posted."
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		authorize @post
		if @post.update(post_params)
			flash[:notice] = "Updated Successfully."
			redirect_to @post
		else 
			render 'edit'
		end
	end

	def destroy
		authorize @post
		@post.destroy
		flash[:notice] = "Deleted."
		redirect_to @post.postable
	end

	private
		def load_postable
    	resource, id = request.path.split('/')[1, 2]
    	@postable = resource.singularize.classify.constantize.find(id)
  	end

		def find_post
			@post = Post.find(params[:id])
		end

		def post_params
			params.require(:post).permit!
		end
end