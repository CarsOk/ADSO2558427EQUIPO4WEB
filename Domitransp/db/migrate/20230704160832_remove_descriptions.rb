class RemoveDescriptions < ActiveRecord::Migration[6.0]
  def change
    drop_table :descriptions, force: :cascade
  end
end
