Easyblog::Application.routes.draw do
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :posts do
    member do
      post :mark_archived      
    end

  end
  post 'add_comment/:id' => 'comments#create', as: 'add_comments'
  post 'vote_up/:id' => 'vote#vote_up', as: 'vote_up'
  post 'vote_down/:id' => 'vote#vote_down', as: 'vote_down'
end
