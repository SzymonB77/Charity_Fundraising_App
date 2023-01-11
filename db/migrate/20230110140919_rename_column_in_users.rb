class RenameColumnInUsers < ActiveRecord::Migration[6.1]
  def up
    rename_column :users, :authentication_method, :verified_user
  end

  def down
    rename_column :users, :verified_user, :authentication_method
  end
end
