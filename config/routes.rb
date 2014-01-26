require 'sidekiq/web'
SidekiqExample::Application.routes.draw do
  # Sidekiq console
  mount Sidekiq::Web, at: '/jobs'

  resources :messages

  resources :site_stats

  root :to => "home#index"
end
