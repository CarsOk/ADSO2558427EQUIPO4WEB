class RemoveColumnDescriptionIdFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :description_id
  end
end
