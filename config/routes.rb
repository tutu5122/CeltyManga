Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controller: {registrations: 'user/registrations'}
  put "/productos/agregar_carro", to: "productos#agregar_carro", as: 'agregar_carro' 
  put "/productos/eliminar_del_carro", to: "productos#eliminar_del_carro", as: 'eliminar_del_carro' 
  put "/productos/mandar_carro", to: "productos#mandar_carro", as: 'mandar_carro' 
  get 'carrito/show'
  #get 'search', to: 'home#search'
  get 'search', to: 'productos#search'
  resources :clientes 
  resources :productos
  resources :generos
   
  root 'home#index'
end
  
