class Dog
  attr_reader :name, :breed, :id
  def initialize(name:, breed:, id: nil)
    @name = name
    @breed = breed
    @id = id
  end
  
  def self.create_table
    sql = "CREATE TABLE IF NOT EXISTS dogs(id INTEGER PRIMARY KEY, name TEXT, breed TEXT)"
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS dogs")
  end
  
  def save
    sql = "INSERT INTO dogs (name,breed)
    VALUES(?,?)"
    DB[:conn].execute(sql,self.name,self.breed)
    result = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")
    @id = result[0][0]
    self
  end
  
  def self.create
  end
end