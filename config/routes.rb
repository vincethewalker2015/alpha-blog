Rails.application.routes.draw do
  root 'pages#home'

  get 'about', to: 'pages#about'
  get 'help', to: 'pages#help'
  resources :articles
  resources :users
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'login', to: 'sessions#destroy'
  
end

