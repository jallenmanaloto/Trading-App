class ChangeAmountTypeToStock < ActiveRecord::Migration[6.1]
  def change
    change_column :stocks, :amount_bought, :float
  end
end
