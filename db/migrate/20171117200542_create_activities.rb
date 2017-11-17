class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :tipo
      t.text :descripcion
      t.date :fecha_inicio
      t.date :fecha_fin

      t.timestamps
    end
  end
end
