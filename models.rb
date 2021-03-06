require_relative 'db'

Sequel::Model.plugin :auto_validations
Sequel::Model.plugin :prepared_statements
Sequel::Model.plugin :prepared_statements_associations
Sequel::Model.plugin :validation_helpers
Sequel::Model.plugin :json_serializer

unless defined?(Unreloader)
  require 'rack/unreloader'
  Unreloader = Rack::Unreloader.new(:reload=>false)
end

Unreloader.require('models') do |f|
  Sequel::Model.send(:camelize, File.basename(f).sub(/\.rb\z/, ''))
end

if ENV['RACK_ENV'] == 'development'
  require 'logger'
  DB.loggers << Logger.new($stdout)
end
