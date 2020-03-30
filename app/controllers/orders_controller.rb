class OrdersController < ApplicationController
  def new
    order = Order.new
    @investment = Investment.find(params[:investment_id])
  end

  def create
  investment = Investment.find(params[:investment_id])
  order  = Order.create!(investment: investment, amount: investment.amount, state: 'pending', user: current_user)

  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: investment.property.name,
      amount: investment.amount_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: order_url(order),
    cancel_url: order_url(order)
  )

  order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
