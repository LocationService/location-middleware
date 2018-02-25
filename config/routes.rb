Rails.application.routes.draw do
  post "auth/login", to: "sessions#create"

  namespace :devices do
    post "auth/login", to: "sessions#create"
    post "auth", to: "registrations#create"
    resources :locations, only: :create
  end

  namespace :api do
    namespace :v1 do
      resource :user, only: :show
      resources :devices, only: :index
      resources :locations, only: :index
    end
  end
end
