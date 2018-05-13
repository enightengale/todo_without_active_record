require("sinatra")
require("sinatra/reloader")
require("./lib/list")
require("./lib/task")
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

get("/lists/:id/edit") do
  @list = List.find(params.fetch("id").to_i())
  erb(:list_edit)
end

patch("/lists/:id") do
  @lists = List.all()
  name = params.fetch("name")
  @list = List.find(params.fetch("id").to_i())
  @list.update({:name => name})
  erb(:list_edit)
end

delete("/lists/:id") do
  @list = List.find(params.fetch("id").to_i())
  @list.delete()
  @lists = List.all()
  erb(:index)
end

post("/tasks") do
  @lists = List.all()
  description = params.fetch("description")
  list_id = params.fetch("list_id").to_i()
  @list = List.find(list_id)
  @task = Task.new({:description => description, :list_id => list_id})
  @task.save()
  erb(:index)
end
