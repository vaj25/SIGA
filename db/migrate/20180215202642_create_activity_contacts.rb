class CreateActivityContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_contacts do |t|

      t.timestamps
    end
  end
end
