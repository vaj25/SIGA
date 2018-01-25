class AddGeneralMeetingIdToMembers < ActiveRecord::Migration[5.1]
  def change
    add_reference :members, :general_meeting, foreign_key: true
  end
end
