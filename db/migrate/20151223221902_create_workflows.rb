class CreateWorkflows < ActiveRecord::Migration
  def change
    create_table :workflows do |t|
      t.string :title
      t.string :type
      t.boolean :active
      t.string :path
      t.integer :folder_id

      t.timestamps null: false
    end
  end
end
