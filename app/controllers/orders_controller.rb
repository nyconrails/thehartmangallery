class OrdersController < ApplicationController
  inherit_resources
  protect_from_forgery

  def new
    @order = Order.new
    @item = Item.find_by_id(params[:item_id])
  end

  def create
    @item = Item.find_by_id(params[:order][:item_id])
    super
  end

end