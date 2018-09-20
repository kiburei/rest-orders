class DashboardController < ApplicationController
  def index
    @orders = Order.all
    @transactions = Transaction.all
  end
end
