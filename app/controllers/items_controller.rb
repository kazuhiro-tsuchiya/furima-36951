class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]

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

  def move_to_signed_in
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end
