class Book < ActiveRecord::Base
	has_many :book_categories
	has_many :categories, through: :book_categories
	has_many :comments, dependent: :destroy


	validates :name, presence: true, uniqueness: true
	validates :author, presence: true
	validates :description, presence: true
	validates :img_url, presence: true


end