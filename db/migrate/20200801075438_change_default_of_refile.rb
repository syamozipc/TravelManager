class ChangeDefaultOfRefile < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :image_id, :string
  end
end
