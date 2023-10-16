class RemoveRolFromRequests < ActiveRecord::Migration[6.0]
  def change
    remove_column :requests, :rol, :string
  end
end
