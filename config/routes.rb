Rails.application.routes.draw do
  match '/domains/search', to:'api/domains#async_domain_update', via: :patch

  #subdomain
  namespace :api, path: '/', constraints: {subdomain: 'api'} do
    resources :accounts
    resources :domains
  end
end

