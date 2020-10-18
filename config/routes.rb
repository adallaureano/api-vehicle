Rails.application.routes.draw do
  resources :vehicles, defaults: {format: :json}
end
