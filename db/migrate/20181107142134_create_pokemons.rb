class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :parent
      t.string :evolution_method
      t.string :sprite
      t.string :sprite_shiny
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :sp_attack
      t.integer :sp_defense
      t.integer :speed
      t.integer :generation_id

      t.timestamps
    end
  end
end
