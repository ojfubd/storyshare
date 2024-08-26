class AddStatusToStories < ActiveRecord::Migration[7.1]
  def change
    add_column :stories, :status, :integer, default: 0, null: false
  end
end
