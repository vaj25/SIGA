class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.decimal :concepto, precision: 8, scale: 2
      t.text :descripcion

      t.timestamps
    end
  end
end
