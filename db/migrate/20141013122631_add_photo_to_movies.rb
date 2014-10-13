class AddPhotoToMovies < ActiveRecord::Migration
  def up
  	add_attachment :movies, :photo
  end

  def down
    remove_attachment :movies, :photo
	end

end
