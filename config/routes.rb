Rails.application.routes.draw do
  get 'plan/new'
  get 'plan/create'
  root 'home#top'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

 resources :stories, only: [:new, :create, :edit, :update, :destroy, :index]

 resources :stories, only: [:show] do
  member do
    get 'sho_story'
    get 'sho_theme'
    get 'sho_world_view'
    get 'sho_text'
  end
end



  get 'pages/howto', to: 'pages#howto'
  get 'pages/low', to: 'pages#low'
  get 'pages/feedback', to: 'pages#feedback'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
