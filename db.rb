require 'sequel'
require 'yaml'
require 'erb'

DB = Sequel.connect(YAML.load(ERB.new(File.read('config/database.yml')).result)['development'])