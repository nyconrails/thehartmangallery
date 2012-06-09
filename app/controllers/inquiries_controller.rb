class InquiriesController < ApplicationController
  inherit_resources
  protect_from_forgery
  
  def new
    @inquiry = Inquiry.new
    @item = Item.find_by_id(params[:item_id])
  end
  
end