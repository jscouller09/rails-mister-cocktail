class CocktailsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end
end
