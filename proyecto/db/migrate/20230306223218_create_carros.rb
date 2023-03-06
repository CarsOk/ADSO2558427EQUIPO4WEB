class CreateCarros < ActiveRecord::Migration[6.1]
  def change
    create_table :carros do |t|
      t.string :placa
      t.integer :modelo
      t.string :color

      t.timestamps
    end
  end
end
