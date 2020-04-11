class MoneyEvent
  def self.all_events
    Database.instance.events.where(type: type)
  end

  def self.type
    to_s
  end

  def initialize(amount:, currency:, category_id:)
    @amount = amount
    @currency = currency.downcase
    @category_id = category_id
  end

  def type
    self.class.to_s
  end

  def valid?
    ::Validators::MoneyEvent.new(amount: amount, currency: currency).validate!
  end

  def save_to_db
    Database.instance.events.insert(
      amount: amount,
      currency: currency,
      type: type,
      category_id: category_id
    )
  end

  attr_reader :amount, :currency, :category_id
end
