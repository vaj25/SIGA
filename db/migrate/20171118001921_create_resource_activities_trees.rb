class CreateResourceActivitiesTrees < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_activities_trees do |t|
      t.integer :cantidad

      t.timestamps
    end
  end
end
