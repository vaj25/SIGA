class CreateDiaries < ActiveRecord::Migration[5.1]
  def change
    create_table :diaries do |t|
      t.string :discusion
      t.text :descripcion
      t.text :acuerdo

      t.timestamps
    end
  end
end
