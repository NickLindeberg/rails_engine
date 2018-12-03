class Api::V1::InvoiceItems::InvoiceItemRandomController < ApplicationController

  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.all.sample)
  end
end
