# == Route Map
#

Rails.application.routes.draw do

  get 'books/index'
  resources :books
  
  root to: "books#index"
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
end
