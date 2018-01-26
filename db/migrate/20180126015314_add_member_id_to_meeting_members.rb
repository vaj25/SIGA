class AddMemberIdToMeetingMembers < ActiveRecord::Migration[5.1]
  def change
    add_reference :meeting_members, :member, foreign_key: true
  end
end
