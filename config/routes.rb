Rails.application.routes.draw do
  resources :workflows
  resources :comments
  resources :technicals
  resources :transcodes
  resources :folders
  resources :states
  resources :media
  resources :metadata
  resources :settings
  resources :tags
  resources :sorts
  resources :types

  resources :links do
    member do
      get 'duplicate'
      put 'move'
    end
  end

  devise_for :users

  get 'pages/home'
  get 'pages/lgin'
  get 'pages/dev'
  get 'links/move'
  get 'folders/manage'

  root to: 'pages#lgin'
end
