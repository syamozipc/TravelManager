class ChangeDefaultOfRefile2 < ActiveRecord::Migration[5.2]
	def up
	  change_column_default :users, :image_id, nil
	end

	def down
	  change_column_default :users, :image_id, "no_image.png"
	end
end
