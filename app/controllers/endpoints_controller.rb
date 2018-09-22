class EndpointsController < ApplicationController
  before_action :set_order, only: [:order, :order_items, :order_transactions, :create_transaction]
  before_action :set_transaction, only: [:transaction]
  include Response
  include ExceptionHandler


  def menu
    @menu = Menu.all
    json_response(@menu)
  end

  def create_order
    @order = Order.new(order_params)
    @order.save!
    json_response(@order)
  end

  def orders
    @orders = Order.all
    json_response(@orders)
  end

  def order
    json_response(@order)
  end

  def order_items
    @order_items = @order.order_items
    json_response(@order_items)
  end

  def create_transaction
    @order.transactions.create!(transaction_params)
  end

  def order_transactions
    @transactions = @order.transactions
    json_response(@transactions)
  end

  def transactions
    @transactions = Transaction.all
    json_response(@transactions)
  end

  def transaction
    json_response(@transaction)
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def set_transaction
    @transaction = Transaction.find(params[:transaction_id])
  end

  def order_params
    params.permit(:table_no)
  end

  def transaction_params
    params.permit(:transaction_amount, :transaction_channel)
  end

end
