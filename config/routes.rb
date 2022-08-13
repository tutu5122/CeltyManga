Rails.application.routes.draw do
  
  resources :clientes
  get 'search', to: 'home#search'
  resources :productos
  resources :generos
   
  root 'home#index'
end
