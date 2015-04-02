class CreateBlabs < ActiveRecord::Migration
  def change
    create_table :blabs do |t|
      t.string :title
      t.text :body
      t.string :url

      t.timestamps null: false
    end
  end
end
