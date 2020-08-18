class ChangeDiscriptionColumnToNullTrue < ActiveRecord::Migration[5.2]
  def change
  	change_column :albums, :discription, :text, null: true
  end
end
