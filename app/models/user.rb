class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments, dependent: :destroy
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", 
                           class_name: "Relationship", 
                           dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name: "Relationship",
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, 
		:default_url => 'missing.jpg',
  	:path => ":class/:attachment/:id/:basename.:extension"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  	
  def feed
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow(other_user)
    relationships.create(followed_id: other_user.id)
  end    

  def unfollow(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end
end
