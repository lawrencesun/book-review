class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
    	t.text :body
    	t.integer :user_id
    	t.references :postable, polymorphic: true
    	
    	t.timestamps
    end
  end

  def down
  	drop_table :posts
  end
end
