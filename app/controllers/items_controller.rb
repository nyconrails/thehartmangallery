class ItemsController < ApplicationController
  inherit_resources

  def index
    if params[:id] == 'all'
      @items = Item.in_stock.page(params[:page]).per_page(50)
      @title = "Jewelry and Antiques"
    elsif params[:id]
      @collection = Collection.find_by_slug(params[:id])
      @items = Item.where(:collection_id => @collection.id).in_stock.page(params[:page]).per_page(50)
      @title = @collection.name
    else
      # render collection blocks, not individual items.
      @collections = Collection.all
      @title = "Jewelry and Antiques"
      render :collections
    end
  end

  def search
    @items = Item.in_stock.where("name LIKE :term", term: "%#{params[:search]}%").page(params[:page]).per_page(50)
    @title = params[:search]
    render :index
  end


end