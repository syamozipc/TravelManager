class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :user_id, null: false
      t.integer :deal, null: false, default: 0

      t.timestamps
    end
  end
end
