class Category
  attr_reader :name

  def initialize(name:)
    @name = name
  end

  def valid?
    return false if name.nil? || name.empty?
    return false if Database.instance.categories.map { |el| el[:name] }.include?(name)

    true
  end

  def save_to_db
    Database.instance.categories.insert(
      name: name
    )
  end
end
