Sequel.migration do
  change do
    add_column :events, :category_id, Integer
  end
end
