SidekiqExample::Application.routes.draw do
  resources :messages

  resources :site_stats

  root :to => "home#index"
end
