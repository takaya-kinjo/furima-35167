class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]

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

  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
  end


    private
    def item_params
      params.require(:item).permit(:title, :comment, :category_id, :quantity_id, :delivery_payment_id, :delivery_prefecture_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id)
    end
end
