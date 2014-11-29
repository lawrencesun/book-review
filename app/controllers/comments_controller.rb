class CommentsController < ApplicationController
	before_filter :load_commentable
	before_action :find_comment, only:[:edit, :update, :destroy]
	before_filter :authenticate_user!
	
	def index
	end

	def show
		redirect_to @commentable
	end

	def new
	end

	def create
		@comment = @commentable.comments.build(comment_params)
		@comment.user = current_user
		if @comment.save
			flash[:notice] = "Successfully Commented."
			redirect_to @commentable
		else
			redirect_to @commentable
		end
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
			flash[:notice] = "Updated."
			redirect_to @commentable
		else 
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		flash[:notice] = "Deleted."
		redirect_to @commentable
	end

	private
		def load_commentable
  		# klass = [Article, Photo, Event].detect { |c| params["#{c.name.underscore}_id"] }
  		# @commentable = klass.find(params["#{klass.name.underscore}_id"])

    	resource, id = request.path.split('/')[1, 2]
    	@commentable = resource.singularize.classify.constantize.find(id)
  	end

		def find_comment
			@comment = @commentable.comments.find(params[:id])
		end

		def comment_params
			params.require(:comment).permit(:body)
		end

end