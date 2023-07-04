class RemoveForeignKeysFromOrders < ActiveRecord::Migration[6.0]
  def change
    drop_table :destinations, force: :cascade
    drop_table :beginnings, force: :cascade
  end
end
