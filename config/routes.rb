ComicReader::Application.routes.draw do

  devise_for :users

  resources :users do
    resources :comments
  end

  root :to => "home#index"


  resources :messages, only: [:create, :destroy]


  resources :subscriptions


  resources :feeds


  resources :strips




end
