HackerNews::Application.routes.draw do
  resources :posts do
    resources :comments
  end

  resources :users do
    resources :posts
    resources :comments
  end

  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  post '/login' => 'sessions#create'
end
