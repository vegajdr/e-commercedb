class User < ActiveRecord::Base

  def create_order item, amount
    purchases.create! item_id: item.id, quantity: amount.to_i

  end

has_many :addresses
has_many :purchases
has_many :items, through: :purchases
end
