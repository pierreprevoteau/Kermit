class CreateTechnicals < ActiveRecord::Migration
  def change
    create_table :technicals do |t|
      t.integer :medium_id
      t.string :key
      t.string :value

      t.timestamps null: false
    end
  end
end
