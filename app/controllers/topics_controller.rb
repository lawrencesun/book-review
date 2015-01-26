class TopicsController < ApplicationController
	before_filter :authenticate_user!, except:[:show, :index]
	before_action :find_topic, only:[:show, :edit, :update, :destroy]


	def index
		@topics = Topic.all.order('created_at DESC').page(params[:page]).per(10)
		respond_to do |format|
			format.html 	
			format.js
		end
	end

	def show
		@comment = Comment.new
		@commentable = @topic
		@comments = @commentable.comments.page(params[:page]).per(10)
		@post = Post.new
		@postable = @topic
		@posts = @postable.posts.page(params[:page]).per(10)
		respond_to do |format|
			format.html
			format.js
		end
	end

	def new
		@topic = Topic.new
		authorize @topic
	end

	def create
		@topic = Topic.new(topic_params)
		authorize @topic
		if @topic.save
			flash[:notice] = "Created Successfully."
			redirect_to @topic
		else 
			render 'new'
		end
	end

	def edit
	end

	def update
		authorize @topic
		if @topic.update(params[:topic].permit!)
			flash[:notice] = "Updated Successfully."
			redirect_to @topic
		else
			render 'edit'
		end
	end

	def destroy
		authorize @topic
		@topic.destroy
		flash[:notice] = "Deleted Successfully."
		redirect_to topics_path
	end

	def active
    @topics = Topic.active.order('created_at DESC').page(params[:page])
    render action: 'index'
	end

	private
		def find_topic
			@topic = Topic.find(params[:id])
		end

		def topic_params
			params.require(:topic).permit!
		end

end