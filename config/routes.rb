CustomCycleCalendar::Application.routes.draw do
  resources :bicycles
  resources :rents
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'application#index'

  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'


end
