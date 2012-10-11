Auditec::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  match 'subir' => 'subir#view', :via => :get
  match 'subir' => 'subir#upload', :via => :post

  match 'proyectos' => 'proyectos#index', :via => :get
  match 'proyectos/create' => 'proyectos#create', :via => :get
  match 'proyectos/:id' => 'proyectos#show', :via => :get
  match 'proyectos/:id/edit' => 'proyectos#edit', :via => :get
  match 'proyectos/:id/:idpc' => 'proyectos#showPC', :via => :get
  match 'proyectos/:id/:idpc/edit' => 'proyectos#editPC', :via => :get  
  match 'proyectos/:id/:idpc/createA' => 'proyectos#createA', :via => :get
  match 'proyectos/:id/:idpc/delete' => 'proyectos#deletePC', :via => :get
  match 'proyectos/:id/:idpc/:ida/edit' => 'proyectos#editA', :via => :get
  
  match 'tipopuntos' => 'tipopuntos#index', :via => :get
  match 'tipopuntos/:id' => 'tipopuntos#show', :via => :get
  match 'tipopuntos/:id/edit' => 'tipopuntos#edit', :via => :get
  match 'tipopuntos/:id/delete' => 'tipopuntos#delete', :via => :get
  match 'tipopuntos/:id/:idta/edit' => 'tipopuntos#editTA', :via => :get
  match 'tipopuntos/:id/:idta/delete' => 'tipopuntos#deleteTA', :via => :get

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

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
