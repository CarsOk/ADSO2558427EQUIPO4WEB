class AddRutToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :rut, :string
  end
end
