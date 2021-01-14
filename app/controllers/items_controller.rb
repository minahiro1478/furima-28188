class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_item, only: [:show, :edit, :update]

  

  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
    
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '出品完了しました'
    else
      render :new, alert: '失敗しました'
    end
  end

  def edit
    if user_signed_in? && current_user.id == @item.user_id
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path, notice: "変更しました"
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :introduction, :category_id, :status_id, :prefecture_id, :postage_id, :shipping_date_id, :user,).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
