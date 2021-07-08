class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update]
  before_action :set_item, only:[:show, :edit, :update]
  before_action :user_set, only:[:edit, :update]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

    private
    def item_params
      params.require(:item).permit(:title, :comment, :category_id, :quantity_id, :delivery_payment_id, :delivery_prefecture_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id)
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def user_set
      unless @item.user_id == current_user.id
        redirect_to root_path
      end
    end


end
