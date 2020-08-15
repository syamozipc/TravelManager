class RenamePostIdColumnToAlbumId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :notifications, :post_id, :album_id
  end
end
