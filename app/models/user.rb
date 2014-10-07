class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments, dependent: :destroy
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name: "Relationships",
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300#", :small => "150x150#", :thumb => "64x64#" },
		:default_url => 'missing.jpg',
		:url => "/assets/users/:id/:style/:basename.:extension",
  	:path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
	validates_attachment :avatar, 
  :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] },
  :size => { :less_than => 5.megabytes }
  	
  def feed
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end    

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy!
  end
end
