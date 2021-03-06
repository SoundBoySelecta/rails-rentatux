class TuxedosController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_tuxedo, only: [:show, :edit, :update, :destroy]

  def index
    @tuxedos = Tuxedo.all.sort.reverse
  end

  def new
    @tuxedo = Tuxedo.new
  end

  def show
  end

  def edit
  end

  def create
    @tuxedo = Tuxedo.new(tuxedo_params)
    @tuxedo.user = current_user
    if @tuxedo.save
      redirect_to tuxedo_path(@tuxedo)
    else
      render :new
    end
  end

  def update
    @tuxedo = Tuxedo.find(params[:id])
    @tuxedo.update(tuxedo_params)
    redirect_to tuxedo_path(@tuxedo)
  end

  def destroy
      @tuxedo.destroy
      redirect_to tuxedos_path
  end

  private

  def tuxedo_params
    params.require(:tuxedo).permit(:picture, :condition, :style, :color, :size, :year, :price)
  end

  def set_tuxedo
    @tuxedo = Tuxedo.find(params[:id])
  end
end
