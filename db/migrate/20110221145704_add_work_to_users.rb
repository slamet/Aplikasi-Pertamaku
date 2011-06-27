class AddWorkToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :work, :string
  end

  def self.down
    remove_column :users, :work
  end
end
