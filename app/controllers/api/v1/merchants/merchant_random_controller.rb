class Api::V1::Merchants::MerchantRandomController < ApplicationController

  def show
    render json: MerchantSerializer.new(Merchant.all.sample)
  end
end
