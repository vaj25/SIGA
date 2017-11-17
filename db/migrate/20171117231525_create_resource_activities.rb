class CreateResourceActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_activities do |t|
      t.text :descripcion
      t.decimal :precio, precision: 8, scale: 2
      t.integer :cantidad

      t.timestamps
    end
  end
end
