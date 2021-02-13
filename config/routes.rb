require 'resque/server'

Rails.application.routes.draw do
  root to: 'application#server_status'
  mount Resque::Server.new, at: '/resque_web'
  namespace :v1, defaults: { format: :json } do
    # all API
  end
end
