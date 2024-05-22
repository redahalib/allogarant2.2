Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "pages#home"
  resources :profiles
  resources :admindashboards
  get "about", to: 'pages#about'
  get "faq", to: 'pages#faq'
  get "mentions_legales", to: 'pages#mentions_legales'
  get "conditions_generales", to: 'pages#conditions_generales'
  get "politique_de_confidentialite", to: 'pages#politique_de_confidentialite'


  # Defines the root path route ("/")
  # root "posts#index"
end
