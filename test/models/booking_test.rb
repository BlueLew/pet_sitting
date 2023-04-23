# frozen_string_literal: true

require 'test_helper'

# Purpose: To test the Booking model
class BookingTest < ActiveSupport::TestCase
  test 'valid booking' do
    booking_params = { first_name: 'John', last_name: 'Doe', animal_name: 'Fido', animal_type: 'dog',
                       hours_requested: 2, date_of_service: DateTime.now + 1.day }

    booking = Booking.new(booking_params)

    assert booking.valid?
  end

  test 'invalid booking' do
    booking_params = { first_name: 'John', last_name: 'Doe', animal_name: 'Fido', animal_type: 'dog',
                       hours_requested: 2, date_of_service: nil }

    booking = Booking.new(booking_params)

    assert_not booking.valid?
  end

  test 'cost_of_service' do
    dog_booking = bookings(:dog)
    cat_booking = bookings(:cat)

    # should return the correct cost for a dog'
    assert_equal 'dog', dog_booking.animal_type
    assert_equal 2, dog_booking.hours_requested
    assert_equal 40.0, dog_booking.cost_of_service

    # should return the correct cost for a cat'
    assert_equal 'cat', cat_booking.animal_type
    assert_equal 3, cat_booking.hours_requested
    assert_equal 35.0, cat_booking.cost_of_service
  end

  test 'date_of_service_cannot_be_in_the_past' do
    booking_params = { first_name: 'John', last_name: 'Doe', animal_name: 'Fido', animal_type: 'dog',
                       hours_requested: 2, date_of_service: DateTime.now - 1.day }

    booking = Booking.new(booking_params)

    assert_no_difference 'Booking.count' do
      booking.save
    end
  end

  test 'booking saved with valid params' do
    booking_params = { first_name: 'John', last_name: 'Doe', animal_name: 'Fido', animal_type: 'dog',
                       hours_requested: 2, date_of_service: DateTime.now + 1.day }

    booking = Booking.new(booking_params)

    assert_difference 'Booking.count', 1 do
      booking.save
    end
  end
end
