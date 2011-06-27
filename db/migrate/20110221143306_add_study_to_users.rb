class AddStudyToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :study, :string
  end

  def self.down
    remove_column :users, :study
  end
end
