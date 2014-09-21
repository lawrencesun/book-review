class AddPhotoToBooks < ActiveRecord::Migration
  def up
  	add_attachment :books, :photo
  end

  def down
  	remove_attachment :books, :photo
  end
end
