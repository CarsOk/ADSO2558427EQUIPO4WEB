class AddOrigenAndDestinoToDispatches < ActiveRecord::Migration[6.0]
  def change
    add_column :dispatches, :origen, :string
    add_column :dispatches, :destino, :string
    remove_column :dispatches, :ruta, :string
  end
end
