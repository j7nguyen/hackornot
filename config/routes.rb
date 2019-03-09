Rails.application.routes.draw do
  get 'static/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static#home'
  resources :events
  resources :votes
  get 'events/overview/:id', to: 'events#overview'
  get 'events/:id/votes', to: 'events#votes'
end
