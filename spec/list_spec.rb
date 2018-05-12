require("rspec")
require("pg")
require("list")

DB = PG.connect({:dbname => "to_do_without_active_record_tests"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
  end
end

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
end
