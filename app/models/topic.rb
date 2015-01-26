class Topic < ActiveRecord::Base
	has_many :comments, {:as => :commentable, :dependent => :destroy}
	has_many :posts, {:as => :postable, :dependent => :destroy}

	has_attached_file :photo, 
		:default_url => 'http://topics-1024.qiniudn.com/bookmissing.jpg',
  	:path => ":class/:attachment/:id/:basename.:extension"
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  scope :active, -> { where("comments_count >= ?", 5) }

	validates :title, presence: true, uniqueness: true
	validates :description, presence: true

end