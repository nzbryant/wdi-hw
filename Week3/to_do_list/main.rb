require 'sinatra'
require 'pry'
require 'sinatra'
require 'httparty'
require 'json'
require 'pg'
require 'active_support/all'




get '/' do
	conn = PG.connect(:dbname =>'Todo', :host => 'localhost')
	todos = conn.exec('SELECT * FROM todos')
	erb :todo, locals: { todos: todos }
end

post '/' do
	conn = PG.connect(:dbname =>'Todo', :host => 'localhost')
	title = request.POST['title']
	desc = request.POST['description']
	sql = "insert into todos (title, description) values ('#{title}', '#{desc}')"
	conn.exec(sql)
	todos = conn.exec('SELECT * FROM todos')
	erb :todo, locals: { todos: todos }
end