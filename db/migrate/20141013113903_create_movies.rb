class CreateMovies < ActiveRecord::Migration
	def up
   	create_table :movies do |t|
      t.string :name
      t.string :director
      t.string :writers
      t.string :stars
      t.string :time
      t.text :description

      t.timestamps
    end
  end

  def down
  	drop_table :movies
  end
end
