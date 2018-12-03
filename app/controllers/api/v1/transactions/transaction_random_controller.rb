class Api::V1::Transactions::TransactionRandomController < ApplicationController

  def show
    render json: TransactionSerializer.new(Transaction.all.sample)
  end
end
