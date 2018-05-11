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
end
