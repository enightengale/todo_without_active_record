require("spec_helper")

describe(List) do

  describe(".all") do
    it("display empty at first") do
      expect(List.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves an instance of List into the db") do
      test_list = List.new({:name => "cleaning", :id => nil})
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end

  describe(".find") do
   it("returns a list by its ID") do
     test_list = List.new({:name => "Epicodus stuff", :id => nil})
     test_list.save()
     test_list2 = List.new({:name => "Home stuff", :id => nil})
     test_list2.save()
     expect(List.find(test_list2.id())).to(eq(test_list2))
   end
 end

  describe("#update") do
    it("lets you update lists in the database") do
      list = List.new({:name => "cleaning", :id => nil})
      list.save()
      list.update({:name => "Homework"})
      expect(list.name()).to(eq("Homework"))
    end
  end

  describe("#delete") do
    it("lets you delete a list from the database") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      list2 = List.new({:name => "House stuff", :id => nil})
      list2.save()
      list.delete()
      expect(List.all()).to(eq([list2]))
    end
  end

  describe("#tasks") do
    it("returns an array of tasks for that list") do
      test_list = List.new({:name => "Epicodus stuff", :id => nil})
      test_list.save()
      test_task = Task.new({:description => "Learn SQL", :list_id => test_list.id()})
      test_task.save()
      test_task2 = Task.new({:description => "Review Ruby", :list_id => test_list.id()})
      test_task2.save()
      expect(test_list.tasks()).to(eq([test_task, test_task2]))
    end
  end
end
