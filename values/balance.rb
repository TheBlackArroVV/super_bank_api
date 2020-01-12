require_relative '../events/money_event'
require_relative '../events/debit'
require_relative '../events/credit'

class Balance
  def count
    uah_result = currency_sum(Debit, 'uah') - currency_sum(Credit, 'uah')
    usd_result = currency_sum(Debit, 'usd') - currency_sum(Credit, 'usd')

    {
      uah: uah_result,
      usd: usd_result
    }
  end

  private

  def currency_sum(klass, currency)
    klass.all_events.where(currency: currency).sum(:amount) || 0
  end
end
