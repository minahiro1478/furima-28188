class PurchaseController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]


  def index
    if @item.purchase.present? || current_user.id == @item.user_id
      redirect_to  root_path
    else
      @purchase_form = PurchaseForm.new
    end
  end

 
  def create
    @purchase_form = PurchaseForm.new(purchase_form_params)   
     if @purchase_form.valid?
       pay_item
       @purchase_form.save
       redirect_to  root_path
     else
       render action: :index
     end
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
  def purchase_form_params
   params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :house_number, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_form_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
