class CreateBooks < ActiveRecord::Migration
  def up
    create_table :books do |t|
      t.string :name
      t.string :author
      t.text :description
      t.string :img_url
      t.timestamps
    end
  end

  def down
  	drop_table :books
  end
end
