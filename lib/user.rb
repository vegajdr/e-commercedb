class User < ActiveRecord::Base


has_many :addresses
has_many :purchases
has_many :items, through: :purchases
end
