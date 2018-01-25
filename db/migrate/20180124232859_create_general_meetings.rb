class CreateGeneralMeetings < ActiveRecord::Migration[5.1]
  def change
    create_table :general_meetings do |t|
      t.integer :num_asistentes

      t.timestamps
    end
  end
end
