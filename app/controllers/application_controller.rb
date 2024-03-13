class ApplicationController < ActionController::Base

    def mis_reservas
        @reservas = current_user.reservas
      end
end
