Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/global_admin', as: 'rails_admin'
  devise_for :admins
  root 'home#index'
end
