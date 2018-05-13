require("rspec")
require("pg")
require("list")
require("task")

DB = PG.connect({:dbname => "to_do_without_active_record_tests"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM tasks *;")
  end
end
