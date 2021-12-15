class AddRememberToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :remember_created_at, :string
  end
end
