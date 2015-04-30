Rails.application.routes.draw do

  resource :session, :only => [:add, :create, :destroy]
  resources :users, :except => [:destroy]

  root 'questions#index'
end
