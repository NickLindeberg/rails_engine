class Api::V1::Customers::CustomerRandomController < ApplicationController

  def show
    render json: CustomerSerializer.new(Customer.all.sample)
  end
end
