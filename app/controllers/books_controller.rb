class BooksController < ApplicationController
	before_filter :authenticate_user!, except:[:show, :index]
	before_action :find_book, only:[:show, :edit, :update, :destroy]


	def index
		@books = Book.all
	end

	def show
		@comment = Comment.new
		respond_to do |format|
			format.html
			format.js
		end
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
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
		if @book.update(params[:book].permit!)
			flash[:notice] = "Updated Successfully."
			redirect_to @book
		else
			render 'edit'
		end
	end

	def destroy
		@book.destroy
		flash[:notice] = "Deleted Successfully."
		redirect_to @books
	end

	private
		def find_book
			@book = Book.find(params[:id])
		end

		def book_params
			params.require(:book).permit!
		end

end