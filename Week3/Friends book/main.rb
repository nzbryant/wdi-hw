add friends
view friends created
delete friends
Include a navbar on all pages: home, new friend, and friends.
The homepage can be whatever you want.
On the new page, create a form to input name, age, gender, image (use a URL), Twitter (URL), and GitHub or Facebook (URL).
The friends page has an image and all their information.The Twitter and GitHub/Facebook should link to those pages. Include icons.
Use Twitter Bootstrap to build this.


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