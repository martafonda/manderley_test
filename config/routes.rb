Manderley::Application.routes.draw do
  resources :movies do
    resources :comments, shallow: true
    resources :people, shallow: true
  end
  
  root 'movies#index'
end
