class AddSellToStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :amount_sold, :integer
  end
end
