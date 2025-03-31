Watchdog::Dashboard::Engine.routes.draw do
  get "dashboard/index"
  get "metrics", to: "dashboard#metrics"
  get "historic", to: "dashboard#historic"

  root to: "dashboard#index"

  post "/analytics", to: "metrics#analytics"
end
