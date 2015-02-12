class Video < ActiveRecord::Base
	has_many :comments, {:as => :commentable, :dependent => :destroy}
	has_many :posts, {:as => :postable, :dependent => :destroy}
	
	validates :title, presence: true, uniqueness: true
	validates :url, presence: true, uniqueness: true
end