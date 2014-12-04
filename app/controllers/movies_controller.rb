class MoviesController < ApplicationController
	before_filter :authenticate_user!, except:[:show, :index]
	before_action :find_movie, only:[:show, :edit, :update, :destroy]


	def index
		@movies = Movie.all.order('created_at DESC').page(params[:page]).per(10)
		respond_to do |format|
			format.html 	
			format.js
		end
	end

	def show
		@comment = Comment.new
		@commentable = @movie
		@comments = @commentable.comments.page(params[:page]).per(10)
		@post = Post.new
		@postable = @movie
		@posts = @postable.posts.page(params[:page]).per(10)
		respond_to do |format|
			format.html
			format.js
		end
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(movie_params)
		if @movie.save
			flash[:notice] = "Created Successfully."
			redirect_to @movie
		else 
			render 'new'
		end
	end

	def edit
	end

	def update
		if @movie.update(params[:movie].permit!)
			flash[:notice] = "Updated Successfully."
			redirect_to @movie
		else
			render 'edit'
		end
	end

	def destroy
		@movie.destroy
		flash[:notice] = "Deleted Successfully."
		redirect_to @movies
	end

	private
		def find_movie
			@movie = Movie.find(params[:id])
		end

		def movie_params
			params.require(:movie).permit!
		end
end