class AddValorToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :valor, :decimal
  end
end
