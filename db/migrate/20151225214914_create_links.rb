class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :medium_id
      t.integer :folder_id

      t.timestamps null: false
    end
  end
end
