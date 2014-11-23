Rails.application.routes.draw do
  resources :item_requests

  get 'dashboard/index'

  get 'spage/welcome'

  get 'spage/about'

  get 'spage/contact'

  get 'spage/legal'

  get 'spage/privacy'

  get 'items/search'

  get 'items/rentnow'

  get 'acceptoffer/:id' => 'item_requests#acceptoffer'
  get 'rejectoffer/:id' => 'item_requests#rejectoffer'
  get 'userofferindex' =>'item_requests#offerindex'
  get 'userrequestindex' => 'item_requests#requestindex'
  get 'pendingrequestindex' => 'item_requests#pendingrequestindex'
  get 'acceptrequestindex' => 'item_requests#acceptrequestindex'
  get 'rejectrequestindex' => 'item_requests#rejectrequestindex'
  get 'pendingofferindex' => 'item_requests#pendingofferindex'
  get 'acceptofferindex' => 'item_requests#acceptofferindex'
  get 'rejectofferindex' => 'item_requests#rejectofferindex'

  devise_for :users
  resources :items
  post 'reviews/create'
  root to: "spage#welcome"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # get 'items/index_user' => 'items#index_user'

  # You can have the root of your site routed with "root"
  # root 'items#index'

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
