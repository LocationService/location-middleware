Rails.application.routes.draw do
  post 'auth/login', to: 'sessions#create'

  namespace :api do
    namespace :v1 do
      resources :devices, only: :index do
        resources :locations, only: :index
      end
    end
  end
end
