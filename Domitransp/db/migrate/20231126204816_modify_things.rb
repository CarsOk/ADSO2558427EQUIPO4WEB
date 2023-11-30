class ModifyThings < ActiveRecord::Migration[6.0]
  def change
    change_column :invoices, :numero_factura, 'integer USING CAST(numero_factura AS integer)'
  end
end