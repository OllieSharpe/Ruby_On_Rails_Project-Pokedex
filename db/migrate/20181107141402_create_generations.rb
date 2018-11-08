class CreateGenerations < ActiveRecord::Migration[5.2]
  def change
    create_table :generations do |t|
      t.string :games
      t.string :region
      t.integer :user_id

      t.timestamps
    end
  end
end
