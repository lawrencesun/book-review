class AddCommentsCountToMovie < ActiveRecord::Migration
  def self.up
    add_column :movies, :comments_count, :integer, :null => false, :default => 0

    Movie.reset_column_information
    Movie.all.each do |m|
      m.update_attribute :comments_count, m.comments.length
    end
  end

  def self.down
    remove_column :movies, :comments_count
  end
end
