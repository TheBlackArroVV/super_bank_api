require 'sequel'

class Database
  include Singelton

  attr_reader :db

  def initialize
    @db = Sequel.connect(DATABASE_URL)
  end
end
