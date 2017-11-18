class AddTreeIdToResourceActivitiesTrees < ActiveRecord::Migration[5.1]
  def change
    add_reference :resource_activities_trees, :tree, foreign_key: true
  end
end
