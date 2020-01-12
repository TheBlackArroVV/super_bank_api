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

    r.on 'credit' do
      r.post do
        credit_event = Credit.new(amount: request.params['amount'],
                                  currency: request.params['currency'])

        if credit_event.valid?
          credit_event.save_to_db
          { result: 'Added to db' }.to_json
        else
          response.status = 422
          { error: 'Vse PLOHO' }.to_json
        end
      end
    end

    r.on 'count' do
      r.get do
        { result: Balance.new.current }.to_json
      end
    end
  end
end
