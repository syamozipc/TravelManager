class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :place, null: false

      t.timestamps
    end
  end
end
