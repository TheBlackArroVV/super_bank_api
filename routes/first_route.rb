# frozen_string_literal: true

require 'fast_jsonapi'

class App
  hash_branch 'first_route' do |r|
    r.on 'hello' do
      r.get do
        'Hello World!'.as_json
      end
    end
  end
end
