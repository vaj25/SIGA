class AddTreeIdToDetailIncomes < ActiveRecord::Migration[5.1]
  def change
    add_reference :detail_incomes, :tree, foreign_key: true
  end
end
