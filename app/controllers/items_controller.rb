class ItemsController < ApplicationController
  inherit_resources

  def index
    if params[:id]
      @collection = Collection.find_by_slug(params[:id])
      @items = Item.where(:collection_id => @collection.id).page(params[:page]).per_page(50)
    else
      @items = Item.page(params[:page]).per_page(50)
    end
  end

  protect_from_forgery
end