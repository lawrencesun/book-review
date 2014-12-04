class AddPostsCount < ActiveRecord::Migration
  def self.up
    add_column :movies, :posts_count, :integer, :null => false, :default => 0
    add_column :books, :posts_count, :integer, :null => false, :default => 0

    Movie.reset_column_information
    Movie.all.each do |m|
      m.update_attribute :posts_count, m.posts.length
    end

    Book.reset_column_information
    Book.all.each do |b|
      b.update_attribute :posts_count, b.posts.length
    end
  end

  def self.down
    remove_column :movies, :posts_count
    remove_column :books, :posts_count
  end
end
