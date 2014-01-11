Missioncreek::Application.routes.draw do
  


  resources :simple_events


  resources :events


  resources :venues

  #get "dashboard/index"

  devise_for :users, :path => 'users', :path_names => { :sign_in =>"login", :sign_out=>"logout"}, :controllers => {registrations: "registrations"}
  resources :users
  resources :artists do
    collection do
      put "update_artists_events"
      put "update_events"
      get "lineup_order"
      post "update_order"
    end
    member do
      get "crop"
      post "perform_crop"
    end
  end

  resources :pages
  resources :dashboard do
    collection do
      get 'artists'
      get 'posts'
      get 'venues'
      get 'pages'
      get 'events'
      get 'simple_events'
      match "match_artists_with_events" => "artists#match_artists_with_events", :via => :get
    end

  end

  match "schedule" => "events#index", :via => :get
  match "artists/front_page_selections" => 'artists#store_front_page_artists', :via => :post
  match "artists/store_display_order" => 'artists#store_display_order', :via => :post
  match "artists/artist_thumb" => 'artists#artist_thumb', :via => :post
  match "interim" => "events#interim_events", :via => :get

  root :to => "Base#index"

  match "/check" => "Base#index"
  match "2013" => "Base#index" 
  resources :posts
  match "tickets" => "Base#tickets"
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
