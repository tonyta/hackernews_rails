HackerNews::Application.routes.draw do
  resources :posts do
    resources :comments
  end

  resources :users do
    resources :posts
    resources :comments
  end

  resources :comments
end
