class AddAttributesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nombre, :string
    add_column :users, :apellido, :string
  end
end
