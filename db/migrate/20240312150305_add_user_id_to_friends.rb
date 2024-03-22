class AddUserIdToFriends < ActiveRecord::Migration[7.1]
  def change
    add_column :friends, :user_id, :integer
  end
end
