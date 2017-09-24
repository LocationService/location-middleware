Rails.application.routes.draw do
  post 'auth/login', to: 'sessions#create'
end
