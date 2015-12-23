class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :title
      t.integer :parent

      t.timestamps null: false
    end
  end
end
