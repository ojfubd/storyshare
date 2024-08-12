class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :story, foreign_key: true
      t.timestamps
    end
    add_index :bookmarks, [:user_id, :story_id], unique: true
  end
end
