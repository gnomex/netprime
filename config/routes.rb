Rails.application.routes.draw do
  devise_for :users

  resources :accounts, param: :slug, only: [:index, :show] do
    resources :videos, param: :slug
  end

  get "video/:slug", to: 'videos#show', as: 'watch_me'
  post "video/:slug", to: "videos#add_view_count", as: 'update_view_count'

  root to: 'home#index'

  get '/inexistente', to: 'errors#not_found', as: :not_found
  match '*path' => 'errors#not_found', via: :all
  match '/500' => 'errors#server_error', via: :all
end
