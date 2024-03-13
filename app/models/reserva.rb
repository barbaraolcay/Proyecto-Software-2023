# Represents a reservation in the application.
class Reserva < ApplicationRecord
  belongs_to :user
  belongs_to :producto
end
