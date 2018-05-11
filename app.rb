require("sinatra")
require("sinatra/reloader")
require("./lib/list")
require("pg")
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "to_do_without_active_record"})

get("/") do
  @lists = List.all()
  erb(:index)
end
