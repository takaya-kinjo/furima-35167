class ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @items = Item.new
  end

  def create
    @items = Itme.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end


    private

    def item_params
      params.require(:item).permit(:titele, :comment, :category, :quantity, :delivery_payment, :delivery_prefecture, :delivery_time, :preice).merge(user_id: current_user.id)
    end
end
