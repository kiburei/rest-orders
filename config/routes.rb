Rails.application.routes.draw do
  devise_for :accounts
  devise_for :cashiers
  root 'dashboard#index'
  get 'history' => 'dashboard#transactions'
  # API endpoints
  get 'menu' => 'endpoints#menu'
  get 'orders' => 'endpoints#orders'
  get 'transactions' => 'endpoints#transactions'
  get 'order/:order_id' => 'endpoints#order'
  get 'order/:order_id/items' => 'endpoints#order_items'
  get 'order/:order_id/transactions' => 'endpoints#order_transactions'
  get 'transaction/:transaction_id' => 'endpoints#transaction'
  post 'order/new' => 'endpoints#create_order'
  post 'order/:order_id/transaction/new' => 'endpoints#create_transaction'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
