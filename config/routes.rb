Rails.application.routes.draw do
  root :to => 'users#index'
  resources :users
  resources :books do
    resources :likes
  end
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

end
