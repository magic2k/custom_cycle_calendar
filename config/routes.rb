CustomCycleCalendar::Application.routes.draw do
  resources :bicycles
  resources :rents
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'application#index'

  match '/signin',   to: 'sessions#new',        via: 'get'
  match '/signout',  to: 'sessions#destroy',    via: 'delete'
  match '/help',     to: 'static_pages#help',   via: 'get'
  match '/rules',    to: 'static_pages#rules',  via: 'get'

  match '404',       to: 'errors#not_found',    via: 'get'
end
