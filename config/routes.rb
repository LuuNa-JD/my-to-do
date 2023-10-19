Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#home'
  resources :groceries
  resources :tasks do
    get 'tasks/:date', to: 'tasks#index', as: 'tasks_by_criteria'
  end


end
