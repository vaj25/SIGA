class AddRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :administrator_rol, :boolean, default: false
    add_column :users, :executive_role, :boolean, default: false
    add_column :users, :subexecutive_role, :boolean, default: false
    add_column :users, :user_role, :boolean, default: true
  end
end
