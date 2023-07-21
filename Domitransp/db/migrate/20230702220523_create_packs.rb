class CreatePacks < ActiveRecord::Migration[6.0]
  def change
    create_table :packs do |t|
      t.references :order, null: false, foreign_key: true
      t.string :tipo
      t.string :cantidad

      t.timestamps
    end
  end
end
