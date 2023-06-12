class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :nit
      t.string :razonSocial

      t.timestamps
    end
  end
end
