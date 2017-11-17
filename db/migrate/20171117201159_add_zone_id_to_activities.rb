class AddZoneIdToActivities < ActiveRecord::Migration[5.1]
  def change
    add_reference :activities, :zone, foreign_key: true
  end
end
