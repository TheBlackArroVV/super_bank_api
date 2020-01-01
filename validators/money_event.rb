module Validators
  class MoneyEvent
    def initialize(currency:, amount:)
      @currency = currency
      @amount = amount
    end

    def validate!
      currency_valid? && amount_valid?
    end

    private

    attr_reader :currency, :amount

    def amount_valid?
      amount.to_i >= 0
    end

    def currency_valid?
      %w[uah usd].include?(currency.downcase)
    end
  end
end
