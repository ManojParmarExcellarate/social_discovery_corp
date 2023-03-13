Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'facebook' => 'facebook_scraper#index', as: :facebook_scraper
  post 'facebook' => 'facebook_scraper#create'
  
  root 'facebook_scraper#index'
end
