class MoneyEvent
  def self.all_events
    Database.instance.events.where(type: type)
  end

  def initialize(amount:, currency:)
    @amount = amount
    @currency = currency
  end

  def type
    self.class.to_s
  end

  def valid?
    ::Validators::MoneyEvent.new(amount: amount, currency: currency).validate!
  end

  def save_to_db
    Database.instance.events.insert(amount: amount, currency: currency, type: type)
  end

  attr_reader :amount, :currency
end
