class CocktailsController < ApplicationController
  before_action :grab_cocktail, only: %i[show]

  def new
  end

  def create
  end

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  private

  def safe_params

  end

  def grab_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
