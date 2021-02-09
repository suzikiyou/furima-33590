class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
       redirect_to root_path
    else
       render :show
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :proprietary_name, :product_description, :category_id , :condition_id, :shipping_charge_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id != @item.user
     redirect_to action: :index
    end
  end
end