class AddMicropostsCountToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :microposts_count, :integer, :null => false, :default => 0

    User.reset_column_information
    User.all.each do |u|
      u.update_attribute :microposts_count, u.microposts.length
    end
  end

  def self.down
    remove_column :users, :microposts_count
  end
end
