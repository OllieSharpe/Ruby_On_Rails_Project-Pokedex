class AddTypeToPokemon < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :type1, :string
    add_column :pokemons, :type2, :string
  end
end
