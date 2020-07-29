class ChangeImageOfUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :image_id, :string, default: 'no_image.png'
  end
end
