require_relative '../events/money_event'
require_relative '../events/debit'
require_relative '../events/credit'

class Balance
  def current
    debit = count(Debit)
    credit = count(Credit)
    res = %i[usd uah].each do |key|
      debit[key].to_i - credit[key].to_i
    end
    res
  end

  def count(klass)
    uah_result = klass.all_events.where(currency: 'uah')
                      .select(:amount).as_json
                      .map { |el| el.values }.flatten
                      .map(&:to_i).inject(:+)

    usd_result = klass.all_events.where(currency: 'usd')
                      .select(:amount).as_json
                      .map { |el| el.values }.flatten
                      .map(&:to_i).inject(:+)

    {uah: uah_result, usd: usd_result}
  end
end
