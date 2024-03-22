Rails.application.routes.draw do
  devise_for :users
  resources :friends
  get 'home/about'
  root 'home#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
