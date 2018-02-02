class AddActivoToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :activo, :boolean
  end
end
