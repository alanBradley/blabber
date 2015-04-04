class AddAttachmentImageToBlabs < ActiveRecord::Migration
  def self.up
    change_table :blabs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :blabs, :image
  end
end
