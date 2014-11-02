class Movie < ActiveRecord::Base
	has_many :comments, {:as => :commentable, :dependent => :destroy}

	validates :name, presence: true, uniqueness: true
	validates :director, presence: true
	validates :stars, presence: true
	validates :time, presence: true
	validates :writers, presence: true

	has_attached_file :photo, 
		:default_url => 'http://topics-1024.qiniudn.com/moviemissing.jpg',
  	:path => ":class/:attachment/:id/:basename.:extension"
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end