Rails.application.routes.draw do

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" 
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
 
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get 'visitor/:id', to:'users#user'

  get 'plan/new'
  get 'plan/create'
  root 'home#top'

  get 'my', to:'home#my'
  get 'myedit', to: 'home#myedit'
  get 'mystory/:id', to: 'home#mystory', as: 'mystory'
  post 'guest_sign_in', to: 'home#new_guest'
  patch 'myupdate', to: 'home#myupdate'
  put 'myupdate', to: 'home#myupdate'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

resources :users, only: [:new, :create, :edit, :update,:show]

  delete 'users/:id', to: 'users#destroy', as: 'delete_user'





  resources :notifications, only: :index

  namespace :admin do
    root "dashboards#index"
    resource :dashboard, only: %i[index]
    get 'login' => 'users_sessions#new', :as => :login
    post 'login' => "users_sessions#create"
    delete 'logout' => 'users_sessions#destroy', :as => :logout
    resources :users
    resources :stories do
      resources :comments, only: [:create, :index, :destroy]
    end
  end

  resources :stories do
    collection do
      get :search, to: 'stories#search'
      get :bookmarks, to: 'stories#bookmarks'
      get :autosearch, to: 'stories#autosearch', format: "js"
      get :searchresult, to: 'stories#tag_result'
    end
    resources :comments, only: [:create, :index, :destroy]
  end

resources :bookmarks, only: %i[create destroy]

resources :stories, only: [:new, :create, :edit, :update, :destroy, :index] do
  resource :likes, only: [:create, :destroy]
end

resources :stories, only: [:show] do
  member do
    get 'sho_story'
    get 'sho_text'
  end
end

resources :password_resets, only: [:new, :create, :edit, :update]

  get 'pages/howto', to: 'pages#howto'
  get 'pages/low', to: 'pages#low'
  get 'update_read', to: 'home#update_read'
  get 'pages/feedback', to: 'pages#feedback'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
