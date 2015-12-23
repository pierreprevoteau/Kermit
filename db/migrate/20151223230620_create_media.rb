class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title
      t.integer :sort_id
      t.integer :state_id
      t.integer :folder_id
      t.string :duration
      t.integer :created_by
      t.integer :updated_by
      t.string :tag_id

      t.timestamps null: false
    end
  end
end
