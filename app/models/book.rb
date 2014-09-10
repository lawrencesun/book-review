class Book < ActiveRecord::Base

	validates :name, presence: true, uniqueness: true
	validates :author, presence: true
	validates :description, presence: true
	validates :img_url, presence: true


end