class AddDefaultValueToResourceActivitiesTrees < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :resource_activities_trees, :cantidad, 0
  end
end
