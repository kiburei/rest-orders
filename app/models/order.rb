class Order < ApplicationRecord
  has_many :order_items
  has_many :transactions
end
