Rails.application.routes.draw do
  namespace :api do
    resources :qadb_results
  end
end
