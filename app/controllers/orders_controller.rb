class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :set_order, only:[:index]

  def index
    @order_shipping_info = OrderShippingInfo.new
  end

  def create
      @order_shipping_info = OrderShippingInfo.new(order_params)
      if @order_shipping_info.valid?
        pay_item
        @order_shipping_info.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def order_params
    params.require(:order_shipping_info).permit(:postal_code, :delivery_prefecture_id, :city, :address, :phone_number, :building).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


  def set_order
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
