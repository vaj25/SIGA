class CreateMeetingMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :meeting_members do |t|

      t.timestamps
    end
  end
end
