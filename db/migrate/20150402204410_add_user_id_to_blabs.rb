class AddUserIdToBlabs < ActiveRecord::Migration
  def change
    add_column :blabs, :user_id, :integer
    add_index :blabs, :user_id
  end
end
