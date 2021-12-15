class AddColumnToTraders < ActiveRecord::Migration[6.1]
  def change
    add_column :traders, :email, :string
  end
end
