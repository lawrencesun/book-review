class Book < ActiveRecord::Base
	has_many :book_categories
	has_many :categories, through: :book_categories
	has_many :comments, dependent: :destroy

	has_attached_file :photo, :styles => { :medium => "212x316!", :thumb => "106x158!" },
		:url => "/assets/books/:id/:style/:basename.:extension",
  	:path => ":rails_root/public/assets/books/:id/:style/:basename.:extension"
	validates_attachment :photo, 
  :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] },
  :size => { :less_than => 5.megabytes }


	validates :name, presence: true, uniqueness: true
	validates :author, presence: true
	validates :description, presence: true



end