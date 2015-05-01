class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  if ENV['http_auth']
    http_basic_authenticate_with name: ENV['http_name'], password: ENV['http_password']
  end
end
