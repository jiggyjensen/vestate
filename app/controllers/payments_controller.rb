class PaymentsController < ApplicationController
  def new
    solid_nav = true
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
  end
end
