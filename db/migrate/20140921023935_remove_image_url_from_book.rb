class RemoveImageUrlFromBook < ActiveRecord::Migration
  def change
  	remove_column :books, :img_url, :string
  end
end
