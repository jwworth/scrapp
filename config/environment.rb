# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Override Rails field_with_errors wrapper (https://coderwall.com/p/s-zwrg)
ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  html_tag.html_safe
end
