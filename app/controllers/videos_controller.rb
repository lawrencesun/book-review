class VideosController < ApplicationController
	before_filter :authenticate_user!, except:[:show, :index]
	before_action :find_video, only:[:show, :edit, :update, :destroy]


	def index
		@videos = Video.all.order('created_at DESC').page(params[:page]).per(10)
		respond_to do |format|
			format.html 	
			format.js
		end
	end

	def show
		@comment = Comment.new
		@commentable = @video
		@comments = @commentable.comments.page(params[:page]).per(10)
		@post = Post.new
		@postable = @video
		@posts = @postable.posts.page(params[:page]).per(10)
		respond_to do |format|
			format.html
			format.js
		end
	end

	def new
		@video = Video.new
		# authorize @video
	end

	def create
		@video = Video.new(video_params)
		# authorize @video
		if @video.save
			flash[:notice] = "Created Successfully."
			redirect_to @video
		else 
			render 'new'
		end
	end

	def edit
	end

	def update
		# authorize @video
		if @video.update(params[:video].permit!)
			flash[:notice] = "Updated Successfully."
			redirect_to @video
		else
			render 'edit'
		end
	end

	def destroy
		# authorize @video
		@video.destroy
		flash[:notice] = "Deleted Successfully."
		redirect_to videos_path
	end

	private
		def find_video
			@video = Video.find(params[:id])
		end

		def video_params
			params.require(:video).permit!
		end

end