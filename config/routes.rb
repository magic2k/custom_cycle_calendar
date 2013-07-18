CustomCycleCalendar::Application.routes.draw do
  resource :bicycles
  root to: 'bicycles#index'

end
