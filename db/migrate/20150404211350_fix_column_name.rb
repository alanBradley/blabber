class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :comments, :link_id, :blab_id
  end
end
