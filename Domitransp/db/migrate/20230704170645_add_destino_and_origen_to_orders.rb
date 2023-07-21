class AddDestinoAndOrigenToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :destino, :string
    add_column :orders, :origen, :string
  end
end
