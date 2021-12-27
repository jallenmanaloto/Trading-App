class ChangeTypeOfColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :stocks, :quantity, :float
  end
end
