class InquiriesController < ApplicationController
  inherit_resources

  def new
    @inquiry = Inquiry.new
    @item = Item.find_by_id(params[:item_id])
  end

  def create
    @item = Item.find_by_id(params[:inquiry][:item_id])
    @inquiry = Inquiry.new(params[:inquiry])

    if @inquiry.save
      Mailer.inquiry_notification(@inquiry).deliver
      render action: :saved
    else
      render action: :new
    end
  end

end