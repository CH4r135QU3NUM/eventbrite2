Rails.application.routes.draw do
  get 'events/index', to:"events#index" 
  get 'events/show', to:"events#show" 
  get 'events/new', to:"events#new" 
  get "events/suscribe/:id", to: "events#suscribe", as: "event_suscription" 
  get 'users/index'
  get 'users/show'
  devise_for :users
  root 'users#index'

    post 'events/show'

resources :events
post "events/suscribe/:id", to: "events#suscribe", as: "event_s"
  
resources :charges, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
