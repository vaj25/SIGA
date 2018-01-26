class AddMeetingIdToMeetingMembers < ActiveRecord::Migration[5.1]
  def change
    add_reference :meeting_members, :meeting, foreign_key: true
  end
end
