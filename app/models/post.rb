class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :postable, ploymorphic: true, counter_cache: true

	validates :body, presence: true

end