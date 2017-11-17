class CreateTrees < ActiveRecord::Migration[5.1]
  def change
    create_table :trees do |t|
      t.string :nombre_comun
      t.string :nombre_cientifico
      t.text :observaciones
      t.integer :cantidad
      t.decimal :precio

      t.timestamps
    end
  end
end
