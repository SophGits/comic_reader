ComicReader::Application.routes.draw do
  resources :messages


  resources :subscriptions


  resources :feeds


  resources :strips


  resources :comments


  devise_for :users

  root :to => "home#index"
end
