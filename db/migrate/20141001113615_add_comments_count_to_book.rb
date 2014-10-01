class AddCommentsCountToBook < ActiveRecord::Migration
  def self.up
    add_column :books, :comments_count, :integer, :null => false, :default => 0

    Book.reset_column_information
    Book.all.each do |b|
      b.update_attribute :comments_count, b.comments.length
    end
  end

  def self.down
    remove_column :bosts, :comments_count
  end
end
