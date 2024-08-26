class CreateStories < ActiveRecord::Migration[7.1]
  def change
    create_table :stories do |t|
      t.string :name, limit: 30, null: false
      t.string :cover, limit: 55
      t.integer :category, null: false
      t.string :theme, limit: 1000
      t.string :motif, limit: 4000
      t.string :memo, limit: 4000
      t.string :place, limit: 2000
      t.string :era, limit: 2000
      t.string :character, limit: 2000
      t.string :body, limit: 10000
      t.timestamps
    end
  end
end
