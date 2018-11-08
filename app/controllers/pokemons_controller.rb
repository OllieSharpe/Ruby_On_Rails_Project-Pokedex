class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  require 'httparty'

  # GET /pokemons
  # GET /pokemons.json
  def index
    @pokemons = Pokemon.all
  end

  # GET /pokemons/1
  # GET /pokemons/1.json
  def show
    @current = Pokemon.all.where("id = #{params[:id]}")
    @pokemon_array = []

    def rollback
      if (@current[0].parent != nil and @current[0].parent != "")
        @current = Pokemon.all.where("name = '#{@current[0].parent}'")
        rollback
      end
    end

    def search
      @pokemon_array.push(@current)
      @current = Pokemon.all.where("parent = '#{@current[0].name}'")
      if (@current.length > 2)
        @pokemon_array.push(@current)
      elsif (@current[0] != nil)
        search
      end
    end

    rollback
    search

    @generation = @pokemon.generation_id
  end

  # GET /pokemons/new
  def new
    @pokemon = Pokemon.new
  end

  # GET /pokemons/1/edit
  def edit
  end

  # POST /pokemons
  # POST /pokemons.json
  def create
    id = api[:name].to_i
    url = "https://pokeapi.co/api/v2/pokemon/#{id}"
    response = HTTParty.get(url)
    response.parsed_response
    type1 = response['types'][0]['type']['name']
    type2 = nil
    if (response['types'][1])
      type1 = response['types'][1]['type']['name']
      type2 = response['types'][0]['type']['name']
    end


    @pokemon = Pokemon.new(name: response['name'], type1: type1, type2: type2, parent: remaining[:parent].downcase, evolution_method: remaining[:evolution_method], sprite: response['sprites']['front_default'], sprite_shiny: response['sprites']['front_shiny'], hp: response['stats'][5]['base_stat'], attack: response['stats'][4]['base_stat'], defense: response['stats'][3]['base_stat'], sp_attack: response['stats'][2]['base_stat'], sp_defense: response['stats'][1]['base_stat'], speed: response['stats'][0]['base_stat'], generation_id:  remaining[:generation_id])

    respond_to do |format|
      if @pokemon.save
        format.html { redirect_to @pokemon, notice: 'Pokemon was successfully created.' }
        format.json { render :show, status: :created, location: @pokemon }
      else
        format.html { render :new }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemons/1
  # PATCH/PUT /pokemons/1.json
  def update
    respond_to do |format|
      if @pokemon.update(pokemon_params)
        format.html { redirect_to @pokemon, notice: 'Pokemon was successfully updated.' }
        format.json { render :show, status: :ok, location: @pokemon }
      else
        format.html { render :edit }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemons/1
  # DELETE /pokemons/1.json
  def destroy
    @pokemon.destroy
    respond_to do |format|
      format.html { redirect_to pokemons_url, notice: 'Pokemon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pokemon_params
      params.require(:pokemon).permit(:name, :type1, :type2, :parent, :evolution_method, :sprite, :sprite_shiny, :hp, :attack, :defense, :sp_attack, :sp_defense, :speed, :generation_id)
    end

    def api
      params.require(:pokemon).permit(:name)
    end

    def remaining
      params.require(:pokemon).permit(:parent, :evolution_method, :generation_id)
    end
end
