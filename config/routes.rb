Rails.application.routes.draw do
  
  put "/productos/agregar_carro", to: "productos#agregar_carro", as: 'agregar_carro' 
  get 'carrito/show'
  get 'search', to: 'home#search'
  resources :clientes 
  resources :productos
  resources :generos
   
  root 'home#index'
end
  
