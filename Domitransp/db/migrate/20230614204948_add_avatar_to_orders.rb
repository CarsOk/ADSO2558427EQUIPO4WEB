class AddAvatarToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :avatar, :string
  end
end
