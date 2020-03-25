require 'api_constraints'

Rails.application.routes.draw do
  devise_for :users
  # Api definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
      resources :users, :only => [:show, :create, :update, :destroy]
    end
  end
end
# curl -H 'Accept: application/vnd.marketplace.v1' \ 
# http://api.market_place_api.dev/users/1
# http://api.lvh.me:3000/users/1