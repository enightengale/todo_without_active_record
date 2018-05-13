require("spec_helper")


describe(Task) do

  describe(".all") do
    it("returns empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a tasks to the db array") do
      task = Task.new({:description => "testing", :list_id => 1})
      task.save()
      expect(Taks.all()).to(eq([task]))
    end
  end
end
