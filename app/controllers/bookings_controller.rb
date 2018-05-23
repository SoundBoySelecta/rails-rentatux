class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_tuxedo, only: [:new, :create, :show, :edit, :index, :destroy]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = current_user.bookings
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.tuxedo = Tuxedo.find(params[:tuxedo_id])
    @booking.user = current_user

    if @booking.save
      redirect_to tuxedo_bookings_path(@tuxedo)
    else
      render :new
    end
  end

  def update
    @booking.update(bookings_params)
    redirect_to tuxedo_booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to tuxedo_bookings_path

  end

  def edit
    if @booking.update(booking_params)
      redirect_to tuxedo_booking_path(@booking)
    else
      render :edit
    end
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
