class AddCodigoEnvioToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :codigo_envio, :string
  end
end
