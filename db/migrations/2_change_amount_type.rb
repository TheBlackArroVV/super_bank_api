Sequel.migration do
  change do
    drop_column :events, :amount
    add_column :events, :amount, Integer
  end
end
