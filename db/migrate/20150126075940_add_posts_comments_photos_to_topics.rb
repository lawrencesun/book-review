class AddPostsCommentsPhotosToTopics < ActiveRecord::Migration
  def self.up
  	add_attachment :topics, :photo
    add_column :topics, :comments_count, :integer, :null => false, :default => 0
    add_column :topics, :posts_count, :integer, :null => false, :default => 0

    Topic.reset_column_information
    Topic.all.each do |t|
      t.update_attribute :comments_count, t.comments.length
      t.update_attribute :posts_count, t.posts.length
    end
  end

  def self.down
  	remove_attachment :topics, :photo
    remove_column :topics, :comments_count
    remove_column :topics, :posts_count
  end
end
