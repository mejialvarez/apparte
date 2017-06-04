Rails.application.routes.draw do
  concern :votable do |options|
    resources :votes, options
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: "sessions#create"

      resources :artworks, only: [:index, :create] do
        resources :talks, only: [:index, :create]
        concerns :votable, only: [:create, :destroy], votable_type: 'Artwork'
      end

      resources :talks, only: [:index, :show] do
        resources :messages, only: [:create]
      end

      resources :users, only: [:index, :create] do
        concerns :votable, only: [:create, :destroy], votable_type: 'User'
      end
    end
  end
end