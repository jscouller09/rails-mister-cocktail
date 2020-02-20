class DosesController < ApplicationController
  before_action :grab_cocktail, only: %i[new create]

  def new
    @dose = Dose.new
  end

  def create
    dose = Dose.new(safe_params)
    dose.cocktail = @cocktail
    if dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new"
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    @cocktail = dose.cocktail
    dose.destroy!
    redirect_to cocktail_path(@cocktail)
  end

  private

  def grab_cocktail
    # if we are supplied an id, find the instance
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def safe_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
