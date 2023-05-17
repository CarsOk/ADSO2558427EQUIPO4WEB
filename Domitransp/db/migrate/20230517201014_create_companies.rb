class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.integer :nit
      t.string :razonSocial
      t.integer :telefono

      t.timestamps
    end
  end
end
