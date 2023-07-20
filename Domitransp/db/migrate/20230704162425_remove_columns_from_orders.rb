class RemoveColumnsFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :destination_id
    remove_column :orders, :beginning_id
  end
end
