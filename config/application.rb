require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module MyScrabble
  class Application < Rails::Application
    config.active_record.schema_format = :sql
    config.time_zone = 'Central Time (US & Canada)'
  end
end
