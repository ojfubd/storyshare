class SorceryCore < ActiveRecord::Migration[7.1]
  def up
    create_table :users do |t|
      t.string :name, null: false, limit: 50
      t.string :email, null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt
      t.timestamps null: false
    end
  end

  def down
    drop_table :users
  end
end
