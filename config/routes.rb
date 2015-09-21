Rails.application.routes.draw do
  root 'main#show'
  namespace :api do
    resources :qadb_results

    # search qadb results by time
    get 'qadb_results/past_days/:day', to: 'qadb_results#search_by_time'

    # search qadb results by testsuite and time
    get 'qadb_results/:testsuite/past_days/:day', to: 'qadb_results#search_by_testsuite_and_time'

    # search qadb results by product and release
    get 'qadb_results/:testsuite/product/:product/release/:release', to: 'qadb_results#search_by_build_info'
  end

  get 'qadb_results/test', to: 'main#test'
end
