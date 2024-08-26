class AddViewsToStories < ActiveRecord::Migration[7.1]
  def change
    add_column :stories, :views, :integer, default: 0
  end
end
