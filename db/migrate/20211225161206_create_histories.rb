class CreateHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :histories do |t|
      t.string :transaction
      t.string :stock_name
      t.string :symbol
      t.string :quantity
      t.string :price
      t.references :trader

      t.timestamps
    end
  end
end
