class CreateBeginnings < ActiveRecord::Migration[6.0]
  def change
    create_table :beginnings do |t|
      t.string :ciudad

      t.timestamps
    end
  end
end
