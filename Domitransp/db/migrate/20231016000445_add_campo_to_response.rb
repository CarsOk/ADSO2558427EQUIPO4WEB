class AddCampoToResponse < ActiveRecord::Migration[6.0]
  def change
    add_column :responses, :rol, :string, default: 'U'
  end
end
