class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :album_id, null: false
      t.string :image_id, null: false

      t.timestamps
    end
  end
end
