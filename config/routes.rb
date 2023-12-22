Rails.application.routes.draw do
  resources :articles_contacts
  resources :articles_diseases
  resources :articles_medicaments
  resources :medicaments
  resources :articles
  resources :contacts
  resources :destinies

  devise_for :users, controllers:{ registrations: 'user/registrations'}

  root to: "main#home"

  resources :travels do
    resources :destinies
  end
  
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
end
