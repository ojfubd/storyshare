class AddReadToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :read, :boolean, default: false
  end
end
