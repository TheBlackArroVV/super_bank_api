# frozen_string_literal: true

Sequel.migration do
  change do
    create_table? :events do
      primary_key :id
      String :currency
      String :amount
      String :type
    end
  end
end
