class AddTraderToStocks < ActiveRecord::Migration[6.1]
  def change
    add_reference :stocks, :trader, null: false, foreign_key: true
  end
end
