class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
    
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '出品完了しました'
    else
      render :new, alert: '失敗しました'
    end
  end

  # def edit
  #   @item = Item.find(params[:id])
  #   @item.item_images.build
  # end

  # def update
  #   @item = Item.find(params[:id])
  #   if @item.update(item_params)
  #     redirect_to item_path, notice: "変更しました"
  #   else
  #     render :edit
  #   end
  # end

  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :introduction, :category_id, :status_id, :prefecture_id, :postage_id, :shipping_date_id, :user,).merge(user_id: current_user.id)
  end
end
