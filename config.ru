# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application
Rails.application.load_server

map '/resque_web' do
  use Rack::Auth::Basic do |username, password|
    [username, password] == [
      Rails.application.credentials.dig(:resque, :username),
      Rails.application.credentials.dig(:resque, :password)
    ]
  end

  run Resque::Server.new
end
