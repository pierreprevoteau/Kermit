Rails.application.routes.draw do
  resources :comments
  resources :technicals
  resources :transcodes
  resources :workflows
  get 'folders/manage'
  resources :folders
  resources :states
  resources :media
  devise_for :users
  resources :technicals
  resources :metadata
  resources :technicals
  get 'links/move'
  resources :links do
    member do
      get 'duplicate'
      put 'move'
    end
  end
  resources :media
  get 'pages/home'
  get 'pages/dev'
  resources :metadata
  resources :settings
  resources :workflows
  resources :tags
  resources :folders
  resources :sorts
  resources :states
  resources :technicals
  resources :media
  resources :metateches
  resources :media
  resources :states
  resources :types
  resources :folders
  resources :tags
  resources :tags
  resources :folders
  resources :types
  resources :states
  resources :media
  resources :media
  resources :states
  resources :types
  resources :media
  root to: 'pages#home'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
