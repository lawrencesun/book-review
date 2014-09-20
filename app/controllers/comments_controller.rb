class CommentsController < ApplicationController
	before_action :get_book
	before_action :find_comment, only:[:edit, :update, :destroy]
	before_filter :authenticate_user!
	
	def new
	end

	def create
		@comment = @book.comments.build(comment_params)
		@comment.user = current_user
		if @comment.save
			flash[:notice] = "Successfully Commented."
			redirect_to @book
		else
			flash[:error] = "Can't be blank."
			redirect_to @book
		end
	end

	def edit
	end

	def update
			if @comment.update(comment_params)
			flash[:notice] = "Updated."
			redirect_to @book
		else 
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		flash[:notice] = "Deleted."
		redirect_to @book
	end

	private
		def get_book
			@book = Book.find(params[:book_id])
		end

		def find_comment
			@comment = Comment.find(params[:id])
		end

		def comment_params
			params.require(:comment).permit(:body)
		end

end