Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/auth', to: 'auth#auth'
      post '/store-user-details', to: 'user#store_user_details'
      get '/user', to: 'user#find_user_by_id'
    end
  end
  match "*path", to: "application#route_not_found", via: :all
end
