require 'bundler'

Bundler.require

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'db/development.sqlite')

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveSupport::Inflector.inflections do |inflect|
    inflect.irregular 'Mimosa', 'Mimosas'
    inflect.irregular 'Vodka Tonic', 'Vodka Tonics'
    inflect.irregular 'Jack & Coke', 'Jack & Cokes'
  end
  
require_all 'lib'