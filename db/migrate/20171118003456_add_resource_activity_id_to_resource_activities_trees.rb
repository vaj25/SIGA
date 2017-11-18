class AddResourceActivityIdToResourceActivitiesTrees < ActiveRecord::Migration[5.1]
  def change
    add_reference :resource_activities_trees, :resource_activity, foreign_key: true
  end
end
