# frozen_string_literal: true

require 'test_helper'

# Purpose: To test the Booking model
class BookingTest < ActiveSupport::TestCase
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
end
