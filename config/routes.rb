Rails.application.routes.draw do
  root 'main#index'

  namespace :api do
    resources :qadb_results
  end

  match '*path_not_found', :to => 'main#index', via: :all
end
