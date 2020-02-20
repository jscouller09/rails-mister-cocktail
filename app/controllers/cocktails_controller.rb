class CocktailsController < ApplicationController
  before_action :grab_cocktail, only: %i[show new]

  def new; end

  def create
    @cocktail = Cocktail.new(safe_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new"
    end
  end

  def index
    @cocktails = Cocktail.all
  end

  def show; end

  private

  def safe_params
    params.require(:cocktail).permit(:name, :pic_url)
  end

  def grab_cocktail
    # if we are supplied an id, find the instance, otherwise return new one
    @cocktail = (params[:id] && Cocktail.find(params[:id])) || Cocktail.new
  end
end
