json.extract! pokemon, :id, :name, :parent, :evolution_method, :sprite, :sprite_shiny, :hp, :attack, :defense, :sp_attack, :sp_defense, :speed, :generation_id, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
