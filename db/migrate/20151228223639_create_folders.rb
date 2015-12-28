class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :title
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end
