class AddActivityIdToGeneralMeetings < ActiveRecord::Migration[5.1]
  def change
    add_reference :general_meetings, :activity, foreign_key: true
  end
end
