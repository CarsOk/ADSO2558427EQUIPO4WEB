class AddUsersCountToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :users_count, :integer
  end
end
