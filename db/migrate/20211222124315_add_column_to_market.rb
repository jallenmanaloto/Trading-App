class AddColumnToMarket < ActiveRecord::Migration[6.1]
  def change
    add_column :markets, :exchangeSegmentName, :string
  end
end
