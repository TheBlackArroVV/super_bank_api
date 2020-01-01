# frozen_string_literal: true

require 'roda'
require 'fast_jsonapi'
require_relative 'events/money_event'
require_relative 'events/debit'
require_relative 'events/credit'
require_relative 'validators/money_event'

class App < Roda
  plugin :hash_routes

  Unreloader.require('routes') {}

  route do |r|
    r.hash_routes('')
  end
end
