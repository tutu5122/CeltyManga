Rails.application.routes.draw do
  
  get 'carrito/show'
  resources :clientes
  get 'search', to: 'home#search'
  resources :productos
  resources :generos
   
  root 'home#index'
end
