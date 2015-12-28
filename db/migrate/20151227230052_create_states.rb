class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :title
      t.string :bd_color

      t.timestamps null: false
    end
  end
end
