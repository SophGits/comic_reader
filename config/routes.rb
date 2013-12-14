ComicReader::Application.routes.draw do

  devise_for  :users,
              :controllers => {:registrations => 'users'}

  devise_scope :user do
    # get "/users/show/:id" => "users#show"
    resources :users, :only => [:show, :index]
    get   'drawing_board',  :to => "users#drawing_board"
  end

  get "/feeds/:feed_id/strips/random", to: "strips#random"

  resources :feeds do
    resources :strips do
      resources :comments
    end
  end

  get "/feeds/:feed_id/strips", to: "strips#show"

  root :to => "home#index"

  resources :messages#, only: [:create, :destroy]
  get '/messages/user/:username', :to => "messages#conversation"

  resources :subscriptions


  resources :searches, only: [:create]




end

