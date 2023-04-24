# frozen_string_literal: true

require 'application_system_test_case'

# Booking flow test
class BookingFlowTest < ApplicationSystemTestCase
  test 'user creates a new booking' do
    visit new_booking_path

    # Fill in the form fields
    fill_in "Owner's first name", with: 'John'
    fill_in "Owner's last name", with: 'Doe'
    fill_in "Pet's name", with: 'Fido'
    select 'dog', from: 'Pet type'
    select '3', from: 'Hours for booking'
    select '2023', from: 'booking_date_of_service_1i' # Select '2023' from the dropdown for year
    select 'July', from: 'booking_date_of_service_2i' # Select 'May' from the dropdown for month
    select '1', from: 'booking_date_of_service_3i' # Select '1' from the dropdown for day
    select '12 PM', from: 'booking_date_of_service_4i' # Select '12' from the dropdown for hour
    select '00', from: 'booking_date_of_service_5i' # Select '00' from the dropdown for minute
    click_on 'Book'

    # Ensure that the booking was created successfully
    assert_text 'Booking created successfully'
    assert_current_path bookings_path
  end

  test 'user creates a new booking with invalid data' do
    visit new_booking_path

    # Don't fill in all required fields
    select 'dog', from: 'Pet type'
    select '3', from: 'Hours for booking'
    select '2023', from: 'booking_date_of_service_1i' # Select '2023' from the dropdown for year
    select 'July', from: 'booking_date_of_service_2i' # Select 'May' from the dropdown for month
    select '1', from: 'booking_date_of_service_3i' # Select '1' from the dropdown for day
    select '12 PM', from: 'booking_date_of_service_4i' # Select '12' from the dropdown for hour
    select '00', from: 'booking_date_of_service_5i' # Select '00' from the dropdown for minute
    click_on 'Book'

    # Ensure that validation errors are displayed
    assert_text "First name can't be blank"
    assert_text "Last name can't be blank"
    assert_text "Animal name can't be blank"
  end

  test 'user visits the all bookings page' do
    visit bookings_path

    assert_text 'All Bookings'
  end
end
