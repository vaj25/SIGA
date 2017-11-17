class AddActivityIdToResourceActivities < ActiveRecord::Migration[5.1]
  def change
    add_reference :resource_activities, :activity, foreign_key: true
  end
end
