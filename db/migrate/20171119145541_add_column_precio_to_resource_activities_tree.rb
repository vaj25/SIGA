class AddColumnPrecioToResourceActivitiesTree < ActiveRecord::Migration[5.1]
  def change
  	add_column(:resource_activities_trees, :precio, :decimal, precision: 8, scale: 2, default: 0.0)
  end
end
