class CreateDispatches < ActiveRecord::Migration[6.0]
  def change
    create_table :dispatches do |t|
      t.string :ruta
      t.time :horario
      t.boolean :switch

      t.timestamps
    end
  end
end
