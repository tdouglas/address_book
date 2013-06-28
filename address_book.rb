require 'pg'
require 'pry'

puts "Hey gurl"

#this establishes a connection to the database
db = PG.connect(:dbname => 'address_book', :host => 'localhost')
first = gets.chomp
last = gets.chomp
name = first + " " + last
age = gets.chomp.to_i
gender = gets.chomp
dtgd = gets.chomp
phone = gets.chomp
email = gets.chomp

select_all = "select * from contacts"
insert_all = "INSERT INTO contacts
(first, last, name, age, gender, dtgd, phone, email)
VALUES ('#{first}', '#{last}', '#{name}', #{age}, '#{gender}', #{dtgd}, '#{phone}', '#{email}')"

select_some_fields = "select '#{name}', #{phone}, #{email}"
db.exec(select_some_fields) do |all_contacts|
  all_contacts.each do |single_contact|
    puts single_contact
  end
end
db.close

puts "input the first name of the person you want to delete"
delete_person = gets.chomp
delete_row = "DELETE from contacts where '#{delete_person}'."
puts "#{@delete_person}.capitalize has been successfully removed from records."
db.exec(delete_row)

db.close

# ------------------------------------------------------
# # use this code to create an address book in sinatra
# # create an input form
# # add a person
# # list people
# require 'pg'
# require 'pry'

# puts "Hey gurl"

# # get all the inputs
# # put them in the string
# # make it work

# # this establishes a connection to the database
# # db = PG.connect(:dbname => 'address_book',
# #   :host => 'localhost')
# # executing sql code
# # passing a string of sql to the database

# # insert into database
# db = PG.connect(:dbname => 'address_book',
#   :host => 'localhost')

# puts "what's your name girl?"
# name = gets.chomp
# sql = "insert into contacts (first) values ('#{name}')"
# db.exec(sql)
# sql = "select first, age from contacts"
# db.exec(sql) do |result|
#   result.each do |row|
#     puts row
#   end
# end
# # db.close
# db.close

# reads from database
# db = PG.connect(:dbname => 'address_book',
#   :host => 'localhost')
# sql = "select first, age from contacts"
# db.exec(sql) do |result|
#   result.each do |row|
#     puts row
#   end
# end
# db.close