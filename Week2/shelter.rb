require 'pry'
require 'pg'

conn = PG.connect(:dbname =>'shelter', :host => 'localhost')
conn.exec( "select * from animals" ) do |result|
  result.each do |row|
    puts row['name']
  end
end

print 'name: '
name = gets.chomp
print 'nickname: '
nickname = gets.chomp
print 'age: '
age = gets.chomp.to_i
print 'number_of_toys: '
number_of_toys = gets.chomp.to_i
print 'breed: '
breed = gets.chomp

sql = "insert into animals (name, nickname, age, number_of_toys, breed) values ('#{name}', '#{nickname}', '#{age}', '#{number_of_toys}', '#{breed}')"
conn.exec(sql)

conn.close