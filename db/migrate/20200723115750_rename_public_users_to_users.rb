class RenamePublicUsersToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_table :public_users, :users
  end
end
