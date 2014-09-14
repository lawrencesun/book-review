class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :body
    	t.integer :user_id, :book_id

    	t.timestamps
    end
  end

  def down
  	drop_table :comments
  end
end
