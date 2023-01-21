class Booking < ApplicationRecord
  has_many :passengers, dependent: :destroy
  belongs_to :flight
  accepts_nested_attributes_for :passengers
end
