class CocktailsController < ApplicationController

  before_action :require_login
  before_action :set_user

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.user = @user
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render action: :new, cocktail: @cocktail
    end
  end

  def dashboard
    @my_cocktails = Cocktail.where("user_id = #{@user.id}")
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end
end
