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
  post 'vote_up/:id' => 'comments#vote_up', as: 'vote_up'
  post 'vote_up/:id' => 'vote#vote_up', as: 'vote_up1'
  post 'vote_down/:id' => 'comments#vote_down', as: 'vote_down'
  post 'mark_as_not_abusive/:id' => 'comments#mark_as_not_abusive', as:'mark_as_not_abusive'
end
