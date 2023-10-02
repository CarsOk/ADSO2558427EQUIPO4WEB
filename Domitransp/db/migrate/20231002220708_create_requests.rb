class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :title
      t.string :name
      t.string :subject
      t.string :email
      t.string :code

      t.timestamps
    end
  end
end
