class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :numero_factura
      t.string :mes_factura
      t.string :factura
      t.string :certificacion
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
