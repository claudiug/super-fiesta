require 'roda'
require_relative 'models'
require 'multi_json'

class App < Roda
  plugin :json

  route do |r|
    r.root do
      r.get do
        User.find_by_id(700)
      end
    end
  end
end