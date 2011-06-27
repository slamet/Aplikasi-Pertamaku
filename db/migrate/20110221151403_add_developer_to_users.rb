class AddDeveloperToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :developer, :string
  end

  def self.down
    remove_column :users, :developer
  end
end
