Rails.application.routes.draw do
  get 'comments/show'
  devise_for :users
  
  resources :articles do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "users#index"
   get 'profile/:id', to: 'users#show', as: 'profile'
   resources :users
  
end
