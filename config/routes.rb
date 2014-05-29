Rails.application.routes.draw do
  # root 'welcome#index'

  #subdomain
  
  namespace :api, path: '/', constraints: {subdomain: 'api'} do
    resources accounts
    resources domains
  end
end

