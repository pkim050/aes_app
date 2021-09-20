Rails.application.routes.draw do
  root to: 'pages#home'

  resources :answers
  resources :questions do
    resources :comments
    collection do
      post :import
    end
  end
  post '/questions/:id' => 'comments#complete'
  resources :users, only: [:update]
  get '/users/:id' => 'users#edit'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :users do
    resources :questions, only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
