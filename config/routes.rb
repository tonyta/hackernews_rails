HackerNews::Application.routes.draw do
  resources :posts

  resources :users do
    resources :posts
  end
end
