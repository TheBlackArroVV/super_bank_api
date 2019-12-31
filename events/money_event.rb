require_relative '../db/database'

class MoneyEvent
  def self.all_events
    Database.instance.events.where(type: type)
  end

  def initialize(amount:, currency:)
    @amount = amount
    @currency = currency
    Database.instance.events.insert(amount: amount, currency: currency, type: type)
  end

  def type
    self.class.to_s
  end

  attr_reader :amount
end
