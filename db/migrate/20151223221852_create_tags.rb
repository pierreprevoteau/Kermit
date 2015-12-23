class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :title
      t.string :bg_color
      t.string :bd_color
      t.string :tx_color

      t.timestamps null: false
    end
  end
end
