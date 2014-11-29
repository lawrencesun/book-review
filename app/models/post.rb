class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :postable, polymorphic: true
	has_many :comments, {:as => :commentable, :dependent => :destroy}

	validates :title, presence: true
	validates :body, presence: true
end