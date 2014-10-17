class AddCommentabletoComments < ActiveRecord::Migration
  def change
  	remove_column :comments, :book_id
  	create_table :comments do |t|
  		t.references :commentable, polymorphic: true
  	end
  end
end
