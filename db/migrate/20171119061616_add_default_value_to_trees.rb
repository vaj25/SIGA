class AddDefaultValueToTrees < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :trees, :cantidad, 0
  	change_column_default :trees, :precio, 0.0
  end
end
