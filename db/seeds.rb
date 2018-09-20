
Menu.create!(item_name: "CHICKEN BIRIANI", item_cost: 450)
Menu.create!(item_name: "PASTA SALDATO", item_cost: 350)
Menu.create!(item_name: "SHAWARMA PLATTA WITH RICE", item_cost: 550)
Menu.create!(item_name: "ETHIOPIAN ANJEERA", item_cost: 500)
Menu.create!(item_name: "OREO SHAKE", item_cost: 350)
Menu.create!(item_name: "STRAWBERRY SHAKE", item_cost: 280)
Menu.create!(item_name: "CHICKEN BURGER WITH YUSRA CHIPS", item_cost: 500)

5.times do
  sum = 0
  Order.create!
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
