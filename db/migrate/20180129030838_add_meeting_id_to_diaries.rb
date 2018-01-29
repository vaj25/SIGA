class AddMeetingIdToDiaries < ActiveRecord::Migration[5.1]
  def change
    add_reference :diaries, :meeting, foreign_key: true
  end
end
