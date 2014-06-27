Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'movies/:id/actors/search' => 'actors#search'
  put 'movies/:movie_id/actors/:id' => 'actors#save'

  get 'sessions/new' => 'sessions#new', as: 'log_in'
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy', as: 'log_out'

  get 'users/new' => 'users#new'
  post 'users' => 'users#create'
  get 'users' => 'users#index'
  root 'movies#index'

  resources :movies do
    resources :actors
  end

end
