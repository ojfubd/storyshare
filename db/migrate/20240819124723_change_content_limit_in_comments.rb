class ChangeContentLimitInComments < ActiveRecord::Migration[7.1]
  def change
    change_column :comments, :content, :text, limit: 400
  end
end
