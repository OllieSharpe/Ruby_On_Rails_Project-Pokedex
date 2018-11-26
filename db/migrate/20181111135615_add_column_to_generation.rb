class AddColumnToGeneration < ActiveRecord::Migration[5.2]
  def change
    add_column :generations, :generation_number, :integer
  end
end
