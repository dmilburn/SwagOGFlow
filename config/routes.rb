Rails.application.routes.draw do
  resources :questions, :except => [:destroy] do
    resources :answers, :except => [:destroy]
  end

  resource :session, :only => [:new, :create, :destroy]
  resources :users, :except => [:destroy]

  root 'questions#index'
end
