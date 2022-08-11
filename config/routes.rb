Rails.application.routes.draw do
   
  resources :productos
  resources :generos
  root 'home#index'
end
