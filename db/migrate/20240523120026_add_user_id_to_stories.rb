class AddUserIdToStories < ActiveRecord::Migration[7.1]
  def change
    add_column :stories, :user_id, :integer
  end
end
