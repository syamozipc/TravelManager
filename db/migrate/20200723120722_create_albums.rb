class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.integer :user_id, null: false
      t.integer :destination_id, null: false
      t.string :title, null: false
      t.text :discription, null: false
      t.integer :range, null: false, default: 0

      t.timestamps
    end
  end
end
