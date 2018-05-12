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
      lists.push(List.new({:name => name, :id => id}))
    end
     return lists
  end

  def save()
    result = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def update(attributes)
    @name = attributes.fetch(:name)
    @id = self.id()
    DB.exec("UPDATE lists SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
   DB.exec("DELETE FROM lists WHERE id = #{self.id()};")
  end

  def self.find(id)
    found_list = nil
    List.all().each() do |list|
      if list.id().==(id)
        found_list = list
      end
    end
    found_list
  end
end
