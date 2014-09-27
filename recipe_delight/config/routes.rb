Rails.application.routes.draw do
    

  get 'shopping_carts/checkout'
  get 'shopping_carts/show'
  put 'shopping_carts/add_item_to_cart'


	resources :coupons
  resources :customers
  resources :items 
  post 'search/', :to => "items#search", :as => 'search_item'
  get 'search/', :to => "items#index"
  get 'search_site/', :to => "items#index"
  post 'search_site/', :to => "items#search_site", :as => 'search_site_item'
  #post 'get_thumbnails/', :to => "items#get_thumbnails", :as => 'get_thumbnails'


  resources :recipes
  post 'search/', :to => "recipes#search", :as => 'search_recipe'
  get 'recipes/searches'

  resources :static_pages, :only => [:index]
	
  get 'sessions/new'
  post 'sessions/create'
  post 'sessions/destroy'

  root :to => "static_pages#home"

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
