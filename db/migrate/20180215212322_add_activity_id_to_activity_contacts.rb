class AddActivityIdToActivityContacts < ActiveRecord::Migration[5.1]
  def change
    add_reference :activity_contacts, :activity, foreign_key: true
  end
end
