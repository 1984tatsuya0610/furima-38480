class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :if_action, only: [:edit, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path(item_params)
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :category_id, :item_condition_id, :postage_type_id, :sender_id, :preparation_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def if_action
    if @item.user_id == current_user.id && @item.order.nil?
    else
      redirect_to root_path
    end
  end

end
