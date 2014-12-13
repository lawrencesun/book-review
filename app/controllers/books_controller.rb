class BooksController < ApplicationController
	before_filter :authenticate_user!, except:[:show, :index]
	before_action :find_book, only:[:show, :edit, :update, :destroy]


	def index
		@books = Book.all.order('created_at DESC').page(params[:page]).per(10)
		respond_to do |format|
			format.html 	
			format.js
		end
	end

	def show
		@comment = Comment.new
		@commentable = @book
		@comments = @commentable.comments.page(params[:page]).per(10)
		@post = Post.new
		@postable = @book
		@posts = @postable.posts.page(params[:page]).per(10)
		respond_to do |format|
			format.html
			format.js
		end
	end

	def new
		@book = Book.new
		authorize @book
	end

	def create
		@book = Book.new(book_params)
		authorize @book	
		if @book.save
			flash[:notice] = "Created Successfully."
			redirect_to @book
		else 
			render 'new'
		end
	end

	def edit
	end

	def update
		authorize @book
		if @book.update(params[:book].permit!)
			flash[:notice] = "Updated Successfully."
			redirect_to @book
		else
			render 'edit'
		end
	end

	def destroy
		authorize @book
		@book.destroy
		flash[:notice] = "Deleted Successfully."
		redirect_to books_path
	end

	def active
    @books = Book.active.order('created_at DESC').page(params[:page])
    render action: 'index'
	end

	private
		def find_book
			@book = Book.find(params[:id])
		end

		def book_params
			params.require(:book).permit!
		end

end