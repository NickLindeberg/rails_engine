class Api::V1::Merchants::MerchantFindController < ApplicationController

  def index
    render json: MerchantSerializer.where(merchant_params)
  end

  def show
    render json: Merchant.find_by(merchant_params)
  end

  private

  def merchant_params
    params.permit("id","name","created_at","updated_at")
  end
end
