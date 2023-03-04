Rails.application.routes.draw do
  root 'pages#home'
  
  resources :coordinates
  resources :sightings
  resources :ufos
end
