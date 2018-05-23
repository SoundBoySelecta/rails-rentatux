class TuxedosController < ApplicationController
skip_before_action :authenticate_user!, only: :index, :show
def index
    @tuxedos = Tuxedo.all
  end

  def new
    @tuxedo = Tuxedo.new
  end

  def show
    @tuxedo = Tuxedo.find(params[:id])
    @bookings = @tuxedo.bookings
    @tuxedo = Tuxedo.new
  end

  def create
    @tuxedo = Tuxedo.new(tux_params)
    @tuxedo.user = current_user
    if @tuxedo.save
      redirect_to tuxedos_show_url
      # redirect_to cocktail_path(@cocktail)
    else
      render :new
    end

  def destroy
      @tuxedo = Tuxedo.find(params[:id])
      @tuxedo.destroy
      redirect_to tuxedos_index_url
      # redirect_to cocktail_path(@dose.cocktail)
  end
end

  private

  def tux_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    params.require(:tuxedo).permit(:picture, :condition, :style, :color, :size, :year)
  end
end
