class Book < ActiveRecord::Base
	has_many :book_categories
	has_many :categories, through: :book_categories
	has_many :comments, {:as => :commentable, :dependent => :destroy}

	has_attached_file :photo, 
		:default_url => 'http://topics-1024.qiniudn.com/bookmissing.jpg',
  	:path => ":class/:attachment/:id/:basename.:extension"
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  scope :active, -> { where("comments_count >= ?", 5) }

	validates :name, presence: true, uniqueness: true
	validates :author, presence: true
	validates :description, presence: true



end