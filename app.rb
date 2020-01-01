# frozen_string_literal: true

require 'roda'
require 'fast_jsonapi'
require_relative 'events/money_event'
Dir[File.join(__dir__, 'events', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'validators', '*.rb')].each { |file| require file }

class App < Roda
  plugin :hash_routes

  Unreloader.require('routes') {}

  route do |r|
    r.hash_routes('')
  end
end
