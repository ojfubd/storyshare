class CreatePlans < ActiveRecord::Migration[7.1]
  def change
    create_table :plans do |t|
      t.integer :story_id, null: false
      t.string :theme, limit: 1000
      t.string :motif, limit: 4000
      t.string :memo, limit: 4000

      t.timestamps
    end
  end
end
