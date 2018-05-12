require("sinatra")
require("sinatra/reloader")
require("./lib/list")
also_reload('lib/**/*.rb')
require("pg")


DB = PG.connect({:dbname => "to_do_without_active_record"})

get("/") do
  @lists = List.all()
  erb(:index)
end

post("/") do
  name = params.fetch("name")
  list = List.new({:name => name, :id => nil})
  list.save()
  @lists = List.all()
  erb(:index)
end
