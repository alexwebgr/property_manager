class PlacesController < ApplicationController
  def search
    res = PlacesService.new.search(params[:input])
    render json: res[:items], status: res[:status]
  end
end
