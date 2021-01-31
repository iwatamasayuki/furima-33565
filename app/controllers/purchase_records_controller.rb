class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :select_item
  before_action :transition_to_index
  
  def index
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params) 
      if @purchase_form.valid?
        pay_item
        @purchase_form.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private
  def purchase_params
    params.require(:purchase_form).permit(:postal, :minicipalities, :prefecture_id, :residence, :building, :phone).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def select_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def transition_to_index
    if current_user.id == @item.user.id || @item.purchase_record.present?
      redirect_to root_path
    end
  end
 
end
