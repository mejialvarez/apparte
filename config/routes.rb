Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :artworks, only: [:index] do
        resources :talks, only: [:create]
      end

      resources :talks, only: [:index, :show] do
        resources :messages, only: [:create]
      end
    end
  end
end