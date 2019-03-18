class Dog
  attr_reader :name, :breed, :id
  def initialize(name:, breed:, id: nil)
    @name = name
    @breed = breed
    @id = id
  end
  
  def self.create_table
    sql = "CREATE TABLE IF NOT EXISTS dogs(id INTEGER PRIMARY KEY, name S"
    DB[:conn].execute(sql)
  end
end