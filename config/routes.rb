Rails.application.routes.draw do
  get 'reservas/index'
  resources :productos, only: [:index, :show]
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'render/about'
  get 'render/preguntas'
  get 'render/parlantes', to: 'productos#parlantes', as: 'render_parlantes'
  post '/parlantes/:id/reservar', to: 'productos#reservar', as: 'reservar_producto'
  get 'admin/reservas', to: 'admin#reservas'
  delete '/parlantes/:id/reservar', to: 'productos#cancelar_reserva', as: 'cancelar_reserva_producto'

  get 'reservas/index', to: 'reservas#index', as: 'mis_reservas'

  resources :reservas do
    patch 'update_estado', on: :member
    delete 'eliminar', on: :member, to: 'reservas#destroy' # Agrega esta línea
  end

  get 'resenas', to: 'resenas#index', as: 'resenas'
  get 'hacer_resena', to: 'resenas#new', as: 'new_resena'
  post 'resenas', to: 'resenas#create', as: 'create_resena'
  get 'resenas', to: 'admin#resenas'
  get 'admin/resenas', to: 'admin#resenas', as: 'admin_resenas'

  resources :resenas do
    delete 'eliminar', on: :member, to: 'resenas#destroy'
  end


  
  get 'reservas', to: 'admin#reservas'
  get 'render/equipos'
  get 'render/otros'

  root 'render#index'
end

