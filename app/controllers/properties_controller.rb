class PropertiesController < ApplicationController
  def new
  end

  def create
  end

  def index
      @properties = Property.all
      if params[:query].present?
      @properties = Property.search_by_name_and_location(params[:query])
      end
  end

  def show
    @property = Property.find(params[:id])
    @markers = [{

      lat: @property.latitude,
      lng: @property.longitude
    }]
  end
end
