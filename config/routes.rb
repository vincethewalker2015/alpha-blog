Rails.application.routes.draw do
  root 'pages#home'
  get 'help', to: 'pages#help'
  resources :articles, only: [:show, :index]
  
end
