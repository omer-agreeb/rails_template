Rails.application.routes.draw do
  root to: 'application#server_status'
  namespace :v1, defaults: { format: :json } do
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
