class AddFirstLoginToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_login, :boolean
  end
end
