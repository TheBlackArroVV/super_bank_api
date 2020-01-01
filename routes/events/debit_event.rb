# frozen_string_literal: true

class App
  hash_branch 'events' do |r|
    r.on 'debit' do
      r.post do
        debit_event = Debit.new(amount: request.params['amount'],
                                currency: request.params['currency'])

        if debit_event.valid?
          debit_event.save_to_db
          { result: 'Added to db' }.to_json
        else
          response.status = 422
          { error: 'Vse PLOHO' }.to_json
        end
      end
    end
  end
end
