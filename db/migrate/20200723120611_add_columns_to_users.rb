class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduction, :string
    add_column :users, :image_id, :string
    add_column :users, :is_active, :boolean, null: false, default: true
  end
end
