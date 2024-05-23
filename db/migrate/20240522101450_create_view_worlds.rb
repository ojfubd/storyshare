class CreateViewWorlds < ActiveRecord::Migration[7.1]
  def change
    create_table :view_worlds do |t|
      t.integer :story_id, null: false
      t.string :place, limit: 2000
      t.string :era, limit: 2000
      t.string :character, limit: 2000
      t.string :others, limit: 2000

      t.timestamps
    end
  end
end
