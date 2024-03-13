 # Represents a user in the application.
 class User < ApplicationRecord
   # Include default devise modules. Others available are:
   # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
 
   has_one_attached :image
   has_many :reservas
   has_many :reviews
 
   def admin?
     admin # Devuelve el valor del atributo admin
   end
 end
