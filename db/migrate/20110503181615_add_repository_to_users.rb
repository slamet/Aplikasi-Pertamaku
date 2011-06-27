class AddRepositoryToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :repository, :string
  end

  def self.down
    remove_column :users, :repository
  end
end
