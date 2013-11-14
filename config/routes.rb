Blog::Application.routes.draw do
  get "posts/" => "blog_post#index"
  post "posts/create" => "blog_post#create"
  get "posts/new" => "blog_post#new", as: :new_post
  get "posts/:slug" => "blog_post#show", as: :post_show

  post "posts/:slug" => "blog_post#create_comment", as: :create_comment
  devise_for :users
  get "home/index"
   root :to => "home#index"

  get "/contact" => "contact#new", as: :contactus
  post "/contact" => "contact#create", as: :contact_create
  get "/ourwork" => "common#ourwork", as: :ourwork
  get "/blog" => "blog_post#index", as: :blog
  get "/user/:username" => "blog_post#index", as: :profile

  get "category/new"
  post "category/create"
  get "category/index"
  get "category/:slug" => "category#show", as: :category_show
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
