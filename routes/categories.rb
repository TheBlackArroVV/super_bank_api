class App
  hash_branch 'categories' do |r|
    r.get do
      { categories: ::Database.instance.categories }.to_json
    end

    r.post do
      category = ::Category.new(name: request.params['name'])

      if category.valid?
        category.save_to_db
        response.status = 201
        { result: 'Added to db' }.to_json
      else
        response.status = 422
        { error: 'Vse PLOHO' }.to_json
      end
    end
  end
end
