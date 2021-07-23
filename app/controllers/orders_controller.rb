class OrdersController < ApplicationController
  before_action :authenticate_user!, expect: :index
  before_action :set_item, only: [:index, :create]

  def index
    @order_shipping_info = OrderShippingInfo.new
  end

  def create
      @order_shipping_info = OrderShippingInfo.new(order_params)
      if @order_shipping_info.valid?
        @order_shipping_info.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def order_params
    params.permit(:item_id, :postal_code, :delivery_prefecture_id, :city, :address, :phone_number, :building).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
