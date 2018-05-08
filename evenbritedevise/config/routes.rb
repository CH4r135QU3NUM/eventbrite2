Rails.application.routes.draw do
  get 'events/index', to:"events#index" 
  get 'events/show', to:"events#show" 
  get 'events/new', to:"events#new"  
  get 'users/index'
  get 'users/show'
  devise_for :users
  root 'users#index'

    

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
