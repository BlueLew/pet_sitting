# frozen_string_literal: true

# Purpose: To create a bookings controller
class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save!
      flash[:success] = 'Booking created successfully'
      redirect_to bookings_url
    else
      flash[:error] = 'Booking could not be created'
      redirect_to new_booking_url
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:first_name, :last_name, :animal_name, :animal_type, :hours_requested,
                                    :date_of_service)
  end
end
