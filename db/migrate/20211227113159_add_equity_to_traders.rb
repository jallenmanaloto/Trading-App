class AddEquityToTraders < ActiveRecord::Migration[6.1]
  def change
    add_column :traders, :equity, :float
  end
end
