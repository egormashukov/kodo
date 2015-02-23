Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}

  namespace :admin do
    resources :invitations, only: [:new, :create]
  end

  root to: 'admin/invitations#new'
end
