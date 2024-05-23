class CreateTexts < ActiveRecord::Migration[7.1]
  def change
    create_table :texts do |t|
      t.integer :story_id , null: false
      t.string :body, limit: 10000
      t.timestamps
    end
  end
end
