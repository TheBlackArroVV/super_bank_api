# frozen_string_literal: true

require 'fast_jsonapi'

class App
  hash_branch 'events' do |r|
    r.on 'debit' do
      r.post do
      end
    end
  end
end
