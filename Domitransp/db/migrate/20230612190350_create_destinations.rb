class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :ciudad

      t.timestamps
    end
  end
end
