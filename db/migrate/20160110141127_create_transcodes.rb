class CreateTranscodes < ActiveRecord::Migration
  def change
    create_table :transcodes do |t|
      t.string :title
      t.string :profile

      t.timestamps null: false
    end
  end
end
