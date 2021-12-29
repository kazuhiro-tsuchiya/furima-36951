class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_explain, :category_id, :quality_id, :burden_id, :area_id, :delivery_day_id, :price, :user,)
  end
end
