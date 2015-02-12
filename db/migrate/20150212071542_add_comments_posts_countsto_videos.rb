class AddCommentsPostsCountstoVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :comments_count, :integer, :null => false, :default => 0
    add_column :videos, :posts_count, :integer, :null => false, :default => 0

    Video.reset_column_information
    Video.all.each do |v|
      v.update_attribute :comments_count, v.comments.length
      v.update_attribute :posts_count, v.posts.length
    end
  end

  def self.down
    remove_column :videos, :comments_count
    remove_column :videos, :posts_count
  end
end
