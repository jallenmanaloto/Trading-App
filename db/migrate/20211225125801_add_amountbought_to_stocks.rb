class AddAmountboughtToStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :amount_bought, :integer
  end
end
