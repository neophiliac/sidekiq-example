SidekiqExample::Application.routes.draw do
  resources :site_stats

  root :to => "home#index"
end
