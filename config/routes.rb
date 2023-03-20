Rails.application.routes.draw do
  root 'offers#home'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
  get '/signout', to: 'sessions#destroy'
  post '/offers/:id/claim', to: 'user_offers#create', as: :claim_offer
  resources :offers, only: [:show]
  resources :users, only: [:new, :create, :show]
end
