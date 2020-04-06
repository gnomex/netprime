Rails.application.routes.draw do
  devise_for :users

  resources :accounts, param: :slug, only: [:show] do
    resources :videos, param: :slug
  end

  get "video/:slug", to: 'videos#show', as: 'watch_me'
  post "video/:slug", to: "videos#add_view_count", as: 'update_view_count'

  root to: 'home#index'

  match '/404' => 'errors#not_found', via: :all
  match '/500' => 'errors#server_error', via: :all
end
