class MembersController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  def dashboard
    @my_tuxedos = current_user.tuxedos
    @my_bookings = current_user.bookings
    @bookings_on_my_tuxedos = current_user.bookings_on_my_tuxedos
  end

  # def show
  #   @member = Member.new
  # end

  # def edit
  #   @members = Member.find(params[:id])
  #   flash[:alert] = "You have successfully updated this booking"
  #   redirect_to member_path(@member)
  # end

  # def update
  #   @member.update(member_params)
  #   flash[:alert] = "You have successfully updated this booking"
  #   redirect_to member_path(@member)
  # end

  # def destroy
  #   @member.destroy
  #   redirect_to tuxedos_path
  # end

  # private

  # def set_booking
  #   @booking = Booking.find(params[:booking_id])
  # end

  # def set_tuxedo
  #   @tuxedo = Tuxedo.find(params[:tuxedo_id])
  # end
end
