class CreateBookCategories < ActiveRecord::Migration
  def up
    create_table :book_categories do |t|
    	t.integer :book_id, :category_id
    	
    	t.timestamps
    end
  end

   def down
  	drop_table :book_categories
  end
end
