CustomCycleCalendar::Application.routes.draw do
  resources :bicycles
  resources :rents
  root to: 'application#index'


end
