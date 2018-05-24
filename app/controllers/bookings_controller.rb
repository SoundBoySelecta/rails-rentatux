class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_tuxedo, only: [:new, :create, :show, :edit, :index, :destroy]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = current_user.bookings
  end

  def show
    redirect_to dashboard_path
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.tuxedo = Tuxedo.find(params[:tuxedo_id])
    @booking.user = current_user
    @booking.status = "Pending"

    if @booking.save!
      redirect_to tuxedo_path(@tuxedo)
    else
      render :new
    end
  end

  def update
    @booking.update(booking_params)
    flash[:notice] = "You have successfully updated this booking"
    redirect_to tuxedo_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to tuxedo_path
  end

  def edit
    # if @booking.update(booking_params)
    #   flash[:alert] = "You have successfully changed this booking"
    #   redirect_to tuxedo_path(@booking)
    # else
    #   flash[:alert] = "You have successfully changed this booking"
    #   render :edit
    # end
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_tuxedo
    @tuxedo = Tuxedo.find(params[:tuxedo_id])
  end
end
