class HomeController < ApplicationController
	def index
		@topics = Topic.order('created_at DESC').limit(10)
		@comments = Comment.order('created_at DESC').limit(10)
	end
end
