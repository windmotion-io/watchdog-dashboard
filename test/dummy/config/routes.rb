Rails.application.routes.draw do
  mount Watchdog::Dashboard::Engine => "/Watchdog-dashboard"
end
