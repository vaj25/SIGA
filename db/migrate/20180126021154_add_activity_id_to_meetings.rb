class AddActivityIdToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_reference :meetings, :activity, foreign_key: true
  end
end
