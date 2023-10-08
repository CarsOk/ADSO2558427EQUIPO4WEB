class AddEstadoToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :estado, :string, default: 'En espera'
    add_column :requests, :rol, :string, default: 'U'
  end
end
