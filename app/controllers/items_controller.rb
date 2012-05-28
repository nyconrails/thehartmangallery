class ItemsController < ApplicationController
  inherit_resources
  
  def index
    if params[:id]
      @items = Item.where(:collection_id => params[:id])
    else
      @items = Item.all
    end
  end
  
  protect_from_forgery
end