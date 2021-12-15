class RemovePasswordFromTraders < ActiveRecord::Migration[6.1]
  def change
    remove_column :traders, :password, :string
  end
end
