class TuxedosController < ApplicationController
mount_uploader :picture, PhotoUploader
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_tuxedo, only: [:show, :edit, :update, :destroy]
  def index
    @tuxedos = Tuxedo.all
  end

  def new
    @tuxedo = Tuxedo.new
  end

  def show
  end

  def create
    @tuxedo = Tuxedo.new(tuxedo_params)
    @tuxedo.user = current_user
    if @tuxedo.save
      redirect_to tuxedos_path
      # redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
      @tuxedo.destroy
      redirect_to tuxedos_path
  end

  private

  def tuxedo_params
    params.require(:tuxedo).permit(:picture, :condition, :style, :color, :size, :year)
  end

  def set_tuxedo
    @tuxedo = Tuxedo.find(params[:id])
  end
end
