Rails.application.routes.draw do

devise_scope :user do
  delete 'users/sessions/destroy'
end

devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
resources :people do
  member do
    patch 'enable'
  end
end

root to: 'people#index'
end
