class CreateMeetings < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings do |t|
      t.text :descripcion

      t.timestamps
    end
  end
end
