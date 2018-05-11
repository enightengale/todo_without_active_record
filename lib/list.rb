class List

  attr_reader(:name, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all()
    db_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    db_lists.each() do |list|
      name = list.fetch("name")
      id = list.fetch("id").to_i()
      lists.push({:name => name, :id => id})
    end
     return lists
  end
end
