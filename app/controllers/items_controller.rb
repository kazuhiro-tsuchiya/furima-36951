class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in?
      @item.destroy
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_explain, :category_id, :quality_id, :burden_id, :area_id, :delivery_day_id,
                                 :price, :user_id, :image).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    redirect_to user_session_path unless user_signed_in?
  end
end
