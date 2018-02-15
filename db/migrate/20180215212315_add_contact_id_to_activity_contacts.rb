class AddContactIdToActivityContacts < ActiveRecord::Migration[5.1]
  def change
    add_reference :activity_contacts, :contact, foreign_key: true
  end
end
