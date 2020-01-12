require 'roda'
require 'fast_jsonapi'
require_relative 'db/database'
require_relative 'events/money_event'
Dir[File.join(__dir__, 'events', '*.rb')].sort.each { |file| require file }
Dir[File.join(__dir__, 'validators', '*.rb')].sort.each { |file| require file }
Dir[File.join(__dir__, 'values', '*.rb')].sort.each { |file| require file }

class App < Roda
  plugin :hash_routes

  Unreloader.require('routes') {}

  route do |r|
    r.hash_routes('')
  end
end
