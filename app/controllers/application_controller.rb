class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  if creds = ENV['basic_auth']
    username, password = creds.split(':', 2)
    http_basic_authenticate_with name: username, password: password
  end
end
