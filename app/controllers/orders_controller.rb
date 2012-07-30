class OrdersController < ApplicationController
  inherit_resources

  def new
    @order = Order.new
    @item = Item.find_by_id(params[:item_id])
  end

  def create
    @item = Item.find_by_id(params[:order][:item_id])
    @order = Order.new(params[:order])

    if @order.save
      Mailer.order_notification(@order).deliver
      render action: :saved
    else
      render action: :new
    end
  end

end