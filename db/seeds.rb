# Create Menu
Menu.create!(item_name: "CHICKEN BIRIANI", item_cost: 450)
Menu.create!(item_name: "PASTA SALDATO", item_cost: 350)
Menu.create!(item_name: "SHAWARMA PLATTA WITH RICE", item_cost: 550)
Menu.create!(item_name: "ETHIOPIAN ANJEERA", item_cost: 500)
Menu.create!(item_name: "OREO SHAKE", item_cost: 350)
Menu.create!(item_name: "STRAWBERRY SHAKE", item_cost: 280)
Menu.create!(item_name: "CHICKEN BURGER WITH YUSRA CHIPS", item_cost: 500)

# Create Orders
20.times do
  sum = 0
  Order.create!(table_no: rand(1..10))
  order = Order.last
  x = rand(1..5)
  x.times do
    order.order_items.create!(menu_id: Menu.pluck(:menu_id).sample)
  end
  order.order_items.each do |x|
    sum += x.menu.item_cost
  end
  order.update(order_cost: sum)
end

# Create Transactions
# Payment for single item on order
5.times do
  order = Order.find(Order.pluck(:order_id).sample)
  transaction = order.transactions.new(transaction_amount: OrderItem.find(order.order_items.pluck(:order_items_id).sample).menu.item_cost)
  if transaction.transaction_amount < order.order_cost && transaction.transaction_amount > order.transactions.sum(:transaction_amount)
    transaction.save!
  end
end

# Partial payment of order
5.times do
  order = Order.find(Order.pluck(:order_id).sample)
  transaction = order.transactions.build(transaction_amount: 1000)
  if transaction.transaction_amount < order.order_cost && transaction.transaction_amount > order.transactions.sum(:transaction_amount)
    transaction.save!
  end
end

# Full payment
2.times do
  order = Order.find(Order.pluck(:order_id).sample)
  transaction = order.transactions.build(transaction_amount: order.order_cost)
  if transaction.transaction_amount == order.order_cost && order.transactions.count == 0
    order.update(status: true)
    transaction.save!
  end
end
