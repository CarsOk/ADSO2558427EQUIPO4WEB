class AddEstadoToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :estado, :string, default: 'En espera'
  end
end
