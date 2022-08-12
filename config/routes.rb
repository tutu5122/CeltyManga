Rails.application.routes.draw do
  
  get 'search', to: 'home#search'
  resources :productos
  resources :generos
   
  root 'home#index'
end
