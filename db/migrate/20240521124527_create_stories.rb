class CreateStories < ActiveRecord::Migration[7.1]
  def change
    create_table :stories do |t|
      t.string :name, limit: 30, null: false
      t.string :cover, limit: 55
      t.integer :category, null: false
      t.timestamps
    end
  end
end
