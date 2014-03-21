CuppaSugar::Application.routes.draw do

devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

devise_for :users

root :to => "items#index"
# root to: "items#index"
authenticated :user do 

  root :to => "devise/sessions#new"
end

resources :items

get "views/items/category" => "items#category"

get "views/users/profile" => "users#profile"

post "users/sms/:id" => "users#sms"

get "view/items" => "items#search"

get "view/items/searchresult" => "items#searchresult"
# resources :users

resources :borrows

# devise_for :users, :controllers => {:omniauth_callbacks => "user/omniauth_callbacks"}

devise_scope :user do
  get "sign_out", :to => "devise/sessions#destroy", :as => :destroy_user_session
end

#          GET      /users/sign_in(.:format)               devise/sessions#new
#             user_session POST     /users/sign_in(.:format)               devise/sessions#create
#     destroy_user_session DELETE   /users/sign_out(.:format)              devise/sessions#destroy
#            user_password POST     /users/password(.:format)              devise/passwords#create
#        new_user_password GET      /users/password/new(.:format)          devise/passwords#new
#       edit_user_password GET      /users/password/edit(.:format)         devise/passwords#edit
#                          PUT      /users/password(.:format)              devise/passwords#update
# cancel_user_registration GET      /users/cancel(.:format)                devise/registrations#cancel
#        user_registration POST     /users(.:format)                       devise/registrations#create
#    new_user_registration GET      /users/sign_up(.:format)               devise/registrations#new
#   edit_user_registration GET      /users/edit(.:format)                  devise/registrations#edit
#                          PUT      /users(.:format)                       devise/registrations#update
#                          DELETE   /users(.:format)                       devise/registrations#destroy
#  user_omniauth_authorize GET|POST /users/auth/:provider(.:format)        devise/omniauth_callbacks#passthru {:provider=>/facebook/}
#   user_omniauth_callback GET|POST /users/auth/:action/callback(.:format) devise/omniauth_callbacks#(?-mix:facebook)
#                     root          /                                      home#index
#                    items GET      /items(.:format)                       items#index
#                          POST     /items(.:format)                       items#create
#                 new_item GET      /items/new(.:format)                   items#new
#                edit_item GET      /items/:id/edit(.:format)              items#edit
#                     item GET      /items/:id(.:format)                   items#show
#                          PUT      /items/:id(.:format)                   items#update
#                          DELETE   /items/:id(.:format)                   items#destroy
#               user_index GET      /user(.:format)                        user#index
#                          POST     /user(.:format)                        user#create
#                 new_user GET      /user/new(.:format)                    user#new
#                edit_user GET      /user/:id/edit(.:format)               user#edit
#                     user GET      /user/:id(.:format)                    user#show
#                          PUT      /user/:id(.:format)                    user#update
#                          DELETE   /user/:id(.:format)                    user#destroy
#             borrow_index GET      /borrow(.:format)                      borrow#index
#                          POST     /borrow(.:format)                      borrow#create
#               new_borrow GET      /borrow/new(.:format)                  borrow#new
#              edit_borrow GET      /borrow/:id/edit(.:format)             borrow#edit
#                   borrow GET      /borrow/:id(.:format)                  borrow#show
#                          PUT      /borrow/:id(.:format)                  borrow#update
#                          DELETE   /borrow/:id(.:format)                  borrow#destroy
#         new_user_session GET      /users/sign_in(.:format)               devise/sessions#new
#                          POST     /users/sign_in(.:format)               devise/sessions#create
#     destroy_user_session DELETE   /users/sign_out(.:format)              devise/sessions#destroy
#                          POST     /users/password(.:format)              devise/passwords#create
#                          GET      /users/password/new(.:format)          devise/passwords#new
#                          GET      /users/password/edit(.:format)         devise/passwords#edit
#                          PUT      /users/password(.:format)              devise/passwords#update
#                          GET      /users/cancel(.:format)                devise/registrations#cancel
#                          POST     /users(.:format)                       devise/registrations#create
#                          GET      /users/sign_up(.:format)               devise/registrations#new
#                          GET      /users/edit(.:format)                  devise/registrations#edit
#                          PUT      /users(.:format)                       devise/registrations#update
#                          DELETE   /users(.:format)                       devise/registrations#destroy
#  user_omniauth_authorize GET|POST /users/auth/:provider(.:format)        user/omniauth_callbacks#passthru {:provider=>/facebook/}
#   user_omniauth_callback GET|POST /users/auth/:action/callback(.:format) user/omniauth_callbacks#(?-mix:facebook)
#     destroy_user_session GET      /sign_out(.:format)                    devise/sessions#destroy











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
