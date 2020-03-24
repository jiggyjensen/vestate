class PropertiesController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
    @property = Property.find(params[:id])
    @markers = [{

      lat: @property.latitude,
      lng: @property.longitude
    }]
  end
end
