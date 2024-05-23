class CreatePlots < ActiveRecord::Migration[7.1]
  def change
    create_table :plots do |t|
      t.integer :story_id, null: false
      t.string :beginning, limit: 1000
      t.string :development, limit: 1000
      t.string :turn, limit: 1000
      t.string :conclusion, limit: 1000

      t.timestamps
    end
  end
end
