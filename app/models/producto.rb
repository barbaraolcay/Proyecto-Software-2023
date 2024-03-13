# Represents a product in the application.
class Producto < ApplicationRecord
  has_one_attached :foto
  has_many :reservas
end
