class DashboardController < ApplicationController

  def index
    @order_stats = Order.all
    @orders = Order.paginate(:page => params[:page], :per_page => 10)
    @transactions = Transaction.all
    @topfoods = OrderItem.order("order_id DESC").offset(3).limit(3)
  end

  def transactions
    @orders = Order.paginate(:page => params[:page], :per_page => 10)
  end

end
