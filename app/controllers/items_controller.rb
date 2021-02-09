class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.includes(:user).order("created_at ASC")
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

  #def edit
    #@item = Item.find(params[:id])
 # end

  #def update
   # item = Item.find(params[:id])
    #itemt.update(item_params)
 #end

 #def destroy
   #item = Item.find(params[:id])
  # item.destroy
 #end

  private

  def item_params
    params.require(:item).permit(:image, :proprietary_name, :product_description, :category_id , :condition_id, :shipping_charge_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end