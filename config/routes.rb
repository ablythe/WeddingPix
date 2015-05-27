Rails.application.routes.draw do
 
  root 'photos#index'

  resources :photos

  get '/subscription', to: 'application#verify'
end
