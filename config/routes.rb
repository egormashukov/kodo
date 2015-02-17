Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :invitations, only: [:new, :create]
  end

  resources :profiles, only: [:show]
end
