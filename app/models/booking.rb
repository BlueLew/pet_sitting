# frozen_string_literal: true

# Purpose: To create a booking model for the database
class Booking < ApplicationRecord
  validates :first_name, :last_name, :animal_name, :animal_type, :hours_requested, :date_of_service, presence: true
  validates :hours_requested,
            numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 8 }
  validates :animal_type, inclusion: { in: %w[dog cat] }

  def cost_of_service
    cost = 20.0
    cost += if animal_type == 'dog'
              10.0 * hours_requested
            else
              5.0 * hours_requested
            end

    cost
  end
end
