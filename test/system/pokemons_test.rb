require "application_system_test_case"

class PokemonsTest < ApplicationSystemTestCase
  setup do
    @pokemon = pokemons(:one)
  end

  test "visiting the index" do
    visit pokemons_url
    assert_selector "h1", text: "Pokemons"
  end

  test "creating a Pokemon" do
    visit pokemons_url
    click_on "New Pokemon"

    fill_in "Attack", with: @pokemon.attack
    fill_in "Defense", with: @pokemon.defense
    fill_in "Evolution Method", with: @pokemon.evolution_method
    fill_in "Generation", with: @pokemon.generation_id
    fill_in "Hp", with: @pokemon.hp
    fill_in "Name", with: @pokemon.name
    fill_in "Parent", with: @pokemon.parent
    fill_in "Sp Attack", with: @pokemon.sp_attack
    fill_in "Sp Defense", with: @pokemon.sp_defense
    fill_in "Speed", with: @pokemon.speed
    fill_in "Sprite", with: @pokemon.sprite
    fill_in "Sprite Shiny", with: @pokemon.sprite_shiny
    click_on "Create Pokemon"

    assert_text "Pokemon was successfully created"
    click_on "Back"
  end

  test "updating a Pokemon" do
    visit pokemons_url
    click_on "Edit", match: :first

    fill_in "Attack", with: @pokemon.attack
    fill_in "Defense", with: @pokemon.defense
    fill_in "Evolution Method", with: @pokemon.evolution_method
    fill_in "Generation", with: @pokemon.generation_id
    fill_in "Hp", with: @pokemon.hp
    fill_in "Name", with: @pokemon.name
    fill_in "Parent", with: @pokemon.parent
    fill_in "Sp Attack", with: @pokemon.sp_attack
    fill_in "Sp Defense", with: @pokemon.sp_defense
    fill_in "Speed", with: @pokemon.speed
    fill_in "Sprite", with: @pokemon.sprite
    fill_in "Sprite Shiny", with: @pokemon.sprite_shiny
    click_on "Update Pokemon"

    assert_text "Pokemon was successfully updated"
    click_on "Back"
  end

  test "destroying a Pokemon" do
    visit pokemons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pokemon was successfully destroyed"
  end
end
