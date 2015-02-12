class CreateVideos < ActiveRecord::Migration
  def up
    create_table :videos do |t|
    	t.string :title
    	t.string :url

    	t.timestamps
    end
  end

  def down
  	drop_table :topics
  end
end
