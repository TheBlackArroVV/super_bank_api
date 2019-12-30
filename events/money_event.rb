class MoneyEvent
  def self.<<(event)
    all_events << event
  end

  def self.all_events
    @all_events ||= []
  end

  def self.count
    res = 0
    all_events.each do |event|
      res += event.amount
    end
    res
  end

  def initialize(amount:, currency:)
    @amount = amount
    @currency = currency
    self.class << self
  end

  attr_reader :amount
end
