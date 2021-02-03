class ItemsController < ApplicationController
  def index
  end

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
