class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    change_table :histories do |t|
      t.rename :transaction, :transaction_name
    end
  end
end
