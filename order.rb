require "./db/setup"
require "./lib/all"

puts "Please enter your First Name:"
first_name = gets.chomp

puts "Please enter your Last Name:"
last_name = gets.chomp

user = User.where(first_name: first_name, last_name: last_name).first_or_create!

puts "Please choose an item from this list:"
items = Item.pluck(:description)
puts items

item_input = gets.chomp
item_chosen = Item.find_by(description: item_input)


binding.pry
puts "How many #{item_input} would you like to buy?"
quantity = gets.chomp

order = user.create_order item_chosen, quantity



binding.pry
