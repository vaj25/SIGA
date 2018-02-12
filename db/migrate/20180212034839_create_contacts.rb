class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.text :nombre
      t.text :email
      t.integer :celular
      t.integer :fijo
      t.text :organizacion

      t.timestamps
    end
  end
end
