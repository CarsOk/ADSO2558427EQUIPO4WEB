class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.date :fecha
      t.integer :consecutivo
      t.references :description, null: false, foreign_key: true
      t.references :beginning, null: false, foreign_key: true
      t.references :destination, null: false, foreign_key: true

      t.timestamps
    end
  end
end
