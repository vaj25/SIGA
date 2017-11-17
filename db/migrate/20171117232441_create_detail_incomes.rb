class CreateDetailIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :detail_incomes do |t|
      t.integer :cantidad
      t.decimal :precio, precision: 8, scale: 2

      t.timestamps
    end
  end
end
