class CreateZones < ActiveRecord::Migration[5.1]
  def change
    create_table :zones do |t|
      t.string :nombre
      t.decimal :area

      t.timestamps
    end
  end
end
