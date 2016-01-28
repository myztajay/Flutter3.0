class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string # add column to "users" called "username" expect a string input
    add_index :users, :username, unique: true #first index table second make sure its unique
  end
end
