Rails.application.routes.draw do

  root :to => 'pages#index'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks",:registrations => "registrations" }
  
  resources :users, only: [:show]

  resources :photos, only: [:create, :destroy] do
    collection do
      get :list
    end
  end

  resources :images, only: [:create, :destroy] do
    collection do
      get :list
    end
  end

  resources :listings

  get 'manage-listing/:id/basics' => 'listings#basics', as: 'manage_listing_basics'
  get 'manage-listing/:id/description' => 'listings#description', as: 'manage_listing_description'
  get 'manage-listing/:id/address' => 'listings#address', as: 'manage_listing_address'
  get 'manage-listing/:id/price' => 'listings#price', as: 'manage_listing_price'
  get 'manage-listing/:id/photos' => 'listings#photos', as: 'manage_listing_photos'
  get 'manage-listing/:id/calendar' => 'listings#calendar', as: 'manage_listing_calendar'
  get 'manage-listing/:id/bankaccount' => 'listings#bankaccount', as: 'manage_listing_bankaccount'
  get 'manage-listing/:id/publish' => 'listings#publish', as: 'manage_listing_publish'

  resources :people

  get 'manage-person/:id/basics' => 'people#basics', as: 'manage_person_basics'
  get 'manage-person/:id/description' => 'people#description', as: 'manage_person_description'
  get 'manage-person/:id/address' => 'people#address', as: 'manage_person_address'
  get 'manage-person/:id/price' => 'people#price', as: 'manage_person_price'
  get 'manage-person/:id/photos' => 'people#photos', as: 'manage_person_photos'
  get 'manage-person/:id/calendar' => 'people#calendar', as: 'manage_person_calendar'
  get 'manage-person/:id/bankaccount' => 'people#bankaccount', as: 'manage_person_bankaccount'
  get 'manage-person/:id/publish' => 'people#publish', as: 'manage_person_publish'


end
