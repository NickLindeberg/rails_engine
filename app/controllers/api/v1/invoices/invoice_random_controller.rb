class Api::V1::Invoices::InvoiceRandomController < ApplicationController

  def show
    render json: InvoiceSerializer.new(Invoice.all.sample)
  end
end
