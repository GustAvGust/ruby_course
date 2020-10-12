require 'pg'
require 'sinatra'
require 'byebug'
require 'sinatra/reloader' if development?

configure {set :server, :puma}

conn = PG.connect(dbname: 'todo_app', host: 'localhost',user: 'postgres', password: 'postgres')

get '/' do
	'Halo'	
end

get '/todos' do
	@results = conn.exec( "SELECT * FROM todos" )
	#conn.exec("SELECT * from todos").reduce.to_s
	erb :index
end

get '/todos/new' do
	erb :new
end

get '/todos/:id/edit' do
	@results = conn.exec("select * from todos where id='#{params['id']}'")[0]
	erb :edit
end

get '/todos/:id' do
	@results = conn.exec("select * from todos where id='#{params['id']}'")[0]
	#"id is #{params['id']}"
	erb :show
end

post '/todos' do
	if params['custom_method'] == 'DELETE'
		@results = conn.exec("delete from todos where id = #{params['id']}")
		redirect to('/todos')
	else
		res = conn.exec("insert into todos(title) values('#{params['title']}') returning id")
		id = res[0]['id']
		redirect to("/todos/#{id}")
	end
end

post '/todos/:id' do
	id = params['id']
	if params['custom_method'] == 'PUT'
		@results = conn.exec("update todos set title='#{params['title']}' where id=#{id} returning id")
	end

	redirect to("/todos/#{id}")
end


# delete "/todos/:id" do
# 	res = conn.exec("delete from todos where id = #{params['id']}")
# 	redirect to('/todos')
# end