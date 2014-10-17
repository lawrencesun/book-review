class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :commentable, ploymorphic: true
	
	validates :body, presence: true

end