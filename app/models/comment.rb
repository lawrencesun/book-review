class Comment < ActiveRecord::Base
	belongs_to :book, counter_cache: true
	belongs_to :user

	validates :body, presence: true

end