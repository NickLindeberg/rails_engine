class Api::V1::Items::ItemRandomController < ApplicationController

  def show
    render json: ItemSerializer.new(Item.all.sample)
  end
end
