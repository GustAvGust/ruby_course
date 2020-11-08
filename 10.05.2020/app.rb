require 'pg'
require 'sinatra'
require 'byebug'
require 'sinatra/reloader' if development?
require './todo.rb'

configure {set :server, :puma}

conn = PG.connect(dbname: 'todo_app', host: 'localhost',user: 'postgres', password: 'postgres')

get '/' do
	'Halo'	
end

get '/todos' do
	@results = ToDo.all(conn)
	#@results = conn.exec( "SELECT * FROM todos" )
	#conn.exec("SELECT * from todos").reduce.to_s
	erb :index
end

get '/todos/new' do
	erb :new
end

get '/todos/:id/edit' do
	@results = ToDo.find_by_id(conn, params['id'])
	# @results = conn.exec("select * from todos where id='#{params['id']}'")[0]
	erb :edit
end

get '/todos/:id' do
	@results = ToDo.find_by_id(conn, params['id'])
	# @results = conn.exec("select * from todos where id='#{params['id']}'")[0]
	#"id is #{params['id']}"
	erb :show
end

post '/todos' do
	if params['custom_method'] == 'DELETE'
		ToDo.find_by_id(conn, params['id']).delete(conn)
		#res = conn.exec("delete from todos where id = #{params['id']}")
		redirect to('/todos')
	else
		# res = conn.exec("insert into todos(title) values('#{params['title']}') returning id")
		# id = res[0]['id']
		todo = ToDo.new(params['title'])
		todo.save(conn)
		redirect to("/todos/#{todo.id}")
	end
end

post '/todos/:id' do
	id = params['id']
	if params['custom_method'] == 'PUT'
		ToDo.find_by_id(conn, id).update(conn, params['title'])
		@results = id
		# @results = conn.exec("update todos set title='#{params['title']}' where id=#{id} returning id")
	end

	redirect to("/todos/#{id}")
end

get '/test' do
	@result = ToDo.where(conn, {id: 2})
	erb :test
end

# delete "/todos/:id" do
# 	res = conn.exec("delete from todos where id = #{params['id']}")
# 	redirect to('/todos')
# end