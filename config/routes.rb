Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get '/users/:id', to: 'users#show', as: 'user'
  resources :users, only: %i(index) do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: %i(create destroy)

  get 'search' => 'posts#search'
  resources :posts, only: %i(new create index show destroy search) do
    resources :photos, only: %i(create)
    resources :post_items, only: %i(create)
  end
end
