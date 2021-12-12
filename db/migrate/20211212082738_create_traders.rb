class CreateTraders < ActiveRecord::Migration[6.1]
  def change
    create_table :traders do |t|
      t.string :name
      t.string :password
      t.boolean :status
      t.bigint :total_cash
      t.integer :total_stocks
      t.integer :profit

      t.timestamps
    end
  end
end
