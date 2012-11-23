source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails',     github: 'rails/rails'
gem 'journey',   github: 'rails/journey'
gem 'arel',      github: 'rails/arel'
gem 'activerecord-deprecated_finders', github: 'rails/activerecord-deprecated_finders'

gem 'bcrypt-ruby', :require => 'bcrypt'

gem 'compass'
gem 'haml-rails', github: 'itzki/haml-rails' #fixed scaffold in Rails4
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass'
gem 'event-calendar', :require => 'event_calendar'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sprockets-rails', github: 'rails/sprockets-rails'
  gem 'sass-rails',   github: 'rails/sass-rails'
  gem 'coffee-rails', github: 'rails/coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', group: :development

# To use debugger
# gem 'debugger'

group :development do
  gem 'sqlite3'
  gem 'pry-rails'
  gem 'rails-erd'
  gem 'html2haml'
  gem 'ruby_parser'

  gem 'rb-fsevent', :require => false
end

group :development, :test do
  gem 'fabrication', github: 'paulelliott/fabrication', branch: 'activerecord4'
end

group :test do
  gem 'guard-minitest'
  gem 'ruby-prof'
end

group :production do
  gem 'pg'
  gem 'thin'
end
