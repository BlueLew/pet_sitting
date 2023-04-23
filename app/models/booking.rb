# frozen_string_literal: true

# Purpose: To create a booking model for the database
class Booking < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :animal_name, presence: true
  validates :animal_type, presence: true
  validates :hours_requested, presence: true
  validates :date_of_service, presence: true
  validates :hours_requested,
            numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 8 }
  validates :animal_type, inclusion: { in: %w[dog cat] }
  validate :date_of_service_cannot_be_in_the_past

  def cost_of_service
    cost = 20.0
    cost += if animal_type == 'dog'
              10.0 * hours_requested
            else
              5.0 * hours_requested
            end

    cost
  end

  private

  def date_of_service_cannot_be_in_the_past
    return unless date_of_service.present? && date_of_service < Time.zone.now

    errors.add(:date_of_service, "can't be in the past")
  end
end
