class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.all
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

  private

  def item_params
    params.require(:item).permit(:image, :proprietary_name, :product_description, :category_id , :condition_id, :shipping_charge_id, :prefectures_id, :days_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end