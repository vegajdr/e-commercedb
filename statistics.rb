require "./db/setup"
require "./lib/all"

#How many items are there?
item_count = Item.all.count
puts "There are #{item_count} items"

#What is the most expensive item?
most_expensive_item = Item.where(price: Item.maximum(:price)).first
puts "The most expensive item is #{most_expensive_item.description}"

#Who lives at 7153 Predovic Falls?
person_at_address = Address.where(street: "7153 Predovic Falls").first
puts "The person that lives at 7153 Predovic Falls is #{person_at_address.user.first_name} #{person_at_address.user.last_name}"

#How many Mediocre Copper Bottle did we sell?
bottles = Item.where(description: "Mediocre Copper Bottle").first

amount_of_bottles = bottles.purchases.inject(0) do |sum, p|
   sum + p.quantity
end
puts "The amount of Mediocre Copper Bottles sold is #{amount_of_bottles}"

#What is our total revenue (item cost * quantity sold for all purchases)?
totals_per_item = []

Item.all.each do |item|
  total = item.purchases.inject(0) do |sum, p|
    sum + p.quantity
  end
  amount = total * item.price
  totals_per_item.push amount
end

revenue = totals_per_item.reduce(:+)
puts "The total revenue is #{revenue}"

#How much did Carmelo Towne spend?
carmelo = User.find_by(first_name: "Carmelo", last_name: "Towne")

totals_per_purchase =[]
carmelo.purchases.each do |p|
  total = p.quantity * p.item.price
  totals_per_purchase.push total
end

spent = totals_per_purchase.reduce(:+)
puts "The total amount spent by Carmelo Towne is #{spent}"

#How many users have > 1 address?
users = User.all.select do |u|
  u.addresses.count > 1
end

puts "The amount of users with more than one address is #{users.count}"
