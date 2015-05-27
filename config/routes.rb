Rails.application.routes.draw do
  devise_for :users
 
  root 'photos#index'

  resources :photos

  get '/subscription', to: 'application#verify'
end
