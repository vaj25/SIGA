class AddDefaultValueToResourceActivities < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :resource_activities, :cantidad, 0
  	change_column_default :resource_activities, :precio, 0.0
  end
end
