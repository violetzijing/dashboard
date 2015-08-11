Rails.application.routes.draw do
  root 'main#index'

  namespace :api do
    resources :qadb_results
    match '/:id', to: 'qadb_results#show', via: :get
  end
end
