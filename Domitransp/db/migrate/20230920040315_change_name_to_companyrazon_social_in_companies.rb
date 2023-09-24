class ChangeNameToCompanyrazonSocialInCompanies < ActiveRecord::Migration[6.0]
  def change
    rename_column :companies, :razonSocial, :razon_social
  end
end
