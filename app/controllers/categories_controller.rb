class CategoriesController < ApplicationController

	def index
	end

	def show
		@category	= Category.find(params[:id])
		@books = @category.books.order('created_at DESC').page(params[:page]).per(15)

		respond_to do |format|
			format.html 	
			format.js
		end
	end


	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = "Created Successfully."
			redirect_to root_path
		else
			render 'new'
		end
	end

	private
		def category_params
			params.require(:category).permit!
		end
end