class Movie < ActiveRecord::Base
	has_many :comments, as :commentable, dependent: :destroy

	validates :name, presence: true, uniqueness: true
	validates :director, presence: true
	validates :stars, presence: true
	validates :time, presence: true
	validates :writers, presence: true

	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" },
		:url => "/assets/movies/:id/:style/:basename.:extension",
  	:path => ":rails_root/public/assets/movies/:id/:style/:basename.:extension"
	validates_attachment :photo, 
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
  :size => { :less_than => 5.megabytes }
end