class AddCategoryIdToBlabs < ActiveRecord::Migration
  def change
    add_column :blabs, :category_id, :integer
  end
end
