Tutoring::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :charges
  root "static_pages#home"
  match '/rates',    to: 'static_pages#rates', via: 'get'
  match '/about',   to: 'static_pages#about', via: 'get'
  match '/faq', to: 'static_pages#faq', via: 'get'
  match '/testimonials', to: 'static_pages#testimonials', via: 'get'
  match '/signup', to: 'users#new', via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/resources', to: 'sessions#resources', via: 'get'
  match '/schedule', to: 'static_pages#schedule', via: 'get'
  #match '/payments', to: 'charges#new', via: 'get'
  #match '/payments', to: 'charges#create', via: 'post'
  #match '/charges/new', to: 'charges#create', via: 'post'

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
  # root to: "static_pages#home"
end
