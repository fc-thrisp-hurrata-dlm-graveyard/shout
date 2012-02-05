source 'http://rubygems.org'

RAILS_VERSION = '~> 3.0.9'
DM_VERSION    = '~> 1.1.0'

gem 'activesupport',      RAILS_VERSION, :require => 'active_support'
gem 'actionpack',         RAILS_VERSION, :require => 'action_pack'
gem 'actionmailer',       RAILS_VERSION, :require => 'action_mailer'
gem 'railties',           RAILS_VERSION, :require => 'rails'

gem 'dm-rails',          '~> 1.1.0'

# You can use any of the other available database adapters.
# This is only a small excerpt of the list of all available adapters
# Have a look at
#
#  http://wiki.github.com/datamapper/dm-core/adapters
#  http://wiki.github.com/datamapper/dm-core/community-plugins
#
# for a rather complete list of available datamapper adapters and plugins

gem 'dm-sqlite-adapter',    DM_VERSION
# gem 'dm-mysql-adapter',     DM_VERSION
# gem 'dm-postgres-adapter',  DM_VERSION
# gem 'dm-oracle-adapter',    DM_VERSION
# gem 'dm-sqlserver-adapter', DM_VERSION

gem 'dm-migrations',        DM_VERSION
gem 'dm-types',             DM_VERSION
gem 'dm-validations',       DM_VERSION
gem 'dm-constraints',       DM_VERSION
gem 'dm-transactions',      DM_VERSION
gem 'dm-aggregates',        DM_VERSION
gem 'dm-timestamps',        DM_VERSION
gem 'dm-observer',          DM_VERSION
gem 'dm-tags',              DM_VERSION
gem 'dm-is-tree',           DM_VERSION
gem 'dm-serializer',        DM_VERSION

# DM added
gem 'dm-accepts_nested_attributes', '~>1.1.0', :git => 'git://github.com/snusnu/dm-accepts_nested_attributes' 
#gem 'dm-devise',         '~> 1.1.4'


# Uploading
gem 'carrierwave'
gem 'carrierwave-datamapper', :require => 'carrierwave/datamapper'
#gem 'rmagick'

#forms
gem 'simple_form'

# templating
gem 'slim'
gem 'slim-rails'
gem 'haml'
gem 'haml-rails'

#pagination
gem 'will_paginate', "~> 3.0.pre2"

# js
#gem 'barista'
gem 'jquery-rails'


#misc
gem 'bcrypt-ruby'
#gem 'log4r'
#gem "rack-mongrel2"
#gem "json"

#
gem 'omniauth'

#server
gem 'thin'
#gem 'unicorn'


#gem 'ruby-debug19'


group(:development, :test) do

  # Uncomment this if you want to use rspec for testing your application

  # gem 'rspec-rails', '~> 2.0.1'

  # To get a detailed overview about what queries get issued and how long they take
  # have a look at rails_metrics. Once you bundled it, you can run
  #
  #   rails g rails_metrics Metric
  #   rake db:automigrate
  #
  # to generate a model that stores the metrics. You can access them by visiting
  #
  #   /rails_metrics
  #
  # in your rails application.

  # gem 'rails_metrics', '~> 0.1', :git => 'git://github.com/engineyard/rails_metrics'

end
