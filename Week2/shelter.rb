require 'pry'
require 'pg'


#Add items

class DataInterchange
	
	#def initalize
	#@dataprog = {}
	#end
	
	def run
		dataprog
	end

	@@conn = PG.connect(:dbname =>'shelter', :host => 'localhost')

	def dataprog
		puts "Welcome to the program. Press 1 to enter animals, or 2 to enter clients"
		puts "1. Enter animals"
		puts "2. Enter clients"
		puts "3. List animals"
		puts "4. List clients"
		puts "...or press q to quit"
		choice = gets.chomp.downcase

		if choice == '1' then
			print 'name: '
			name = gets.chomp.to_s
			print 'nickname: '
			nickname = gets.chomp.to_s
			print 'age: '
			age = gets.chomp.to_i
			print 'number_of_toys: '
			number_of_toys = gets.chomp.to_i
			print 'breed: '
			breed = gets.chomp.to_s

			sqlanimal = "insert into animals (name, nickname, age, number_of_toys, breed) values ('#{name}', '#{nickname}', '#{age}', '#{number_of_toys}', 
				'#{breed}')"
			@@conn.exec(sqlanimal)
			
		elsif choice == '2' then
			print 'name: '
			name = gets.chomp.to_s
			print 'age: '
			age = gets.chomp.to_i

			sqlclient = "insert into clients (name, age) values ('#{name}', '#{age}')"
			@@conn.exec(sqlclient)
			
		elsif choice == '3' then		
			@@conn.exec( "select * from animals" ) do |result|
			  result.each do |row|
			    puts row['name']
		#How print all columns? 
				end
			end

		elsif choice == '4' then		
			@@conn.exec( "select * from clients" ) do |result|
			  result.each do |row|
			    puts row['name']
			  end
			end

		elsif choice == 'q' then
			return "See you next time..." 		
			
		else
			puts 'I don\'t understand your command.'
		end

	#How get play_again to work?
		def play_again
		  	puts "Try again? (Y/n)"
		  	ans = gets.chomp
		  	ans.downcase == "y" || ans == ""
			
			if ans == "y" then dataprog
			end
		end		

		@@conn.close
	
	end

end

d = DataInterchange.new
d.run



