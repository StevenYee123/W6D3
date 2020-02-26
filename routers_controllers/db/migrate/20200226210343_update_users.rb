class UpdateUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :name, :string, unique: true, null: false
    rename_column :users, :name, :username 
  end
end
