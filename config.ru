# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server

map "/resque_web" do
  use Rack::Auth::Basic do |username, password|
    [username, password] == ['abc', '123'
      # Rails.application.credentials.dig(:resque, :user_name),
      # Rails.application.credentials.dig(:resque, :password)
    ]
  end
  run Resque::Server.new
end
