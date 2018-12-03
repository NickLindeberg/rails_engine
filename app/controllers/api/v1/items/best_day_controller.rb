class Api::V1::Items::ItemBestDayController < ApplicationController

  def index
    best_day = Invoice.best_day(params[:id]).created_at
    render json: Item.find(best_day)
  end

end
