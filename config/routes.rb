ComicReader::Application.routes.draw do

  devise_for  :users,
              :controllers => {:registrations => 'users'}

  devise_scope :user do
    # get "/users/show/:id" => "users#show"
    resources :users, :only => [:show, :index]
    get   'drawing_board',  :to => "users#drawing_board"
  end



  resources :feeds do
    resources :strips do
      resources :comments
    end
  end

  root :to => "home#index"

  resources :messages#, only: [:create, :destroy]
  get '/messages/user/:username', :to => "messages#conversation"

  resources :subscriptions

end

