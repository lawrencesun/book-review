class HomeController < ApplicationController
	def index
		@books = Book.last(10)
		@comments = Comment.last(10)
	end
end
