class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :story, foreign_key: true
      t.timestamps
    end
    add_index :likes, [:user_id, :story_id], unique: true
  end
end
