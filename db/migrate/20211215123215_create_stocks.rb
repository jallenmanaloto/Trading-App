class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.bigint :latest_price
      t.integer :change_percent
      t.string :symbol
      t.string :company_logo

      t.timestamps
    end
  end
end
