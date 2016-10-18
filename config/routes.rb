Rails.application.routes.draw do
  get 'sessions/new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'signup' => 'users#new'
  delete 'logout' => 'sessions#destroy'

  root 'welcome#index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
