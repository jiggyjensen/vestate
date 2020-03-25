class PropertiesController < ApplicationController
  def new
  end

  def create
  end

  def index
      @properties = Property.geocoded
    if params[:query].present?
      @properties = Property.search_by_name_and_location(params[:query])
      @markers = @properties.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude
      }
        end
      else
        @markers = @properties.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude
      }
        end
    end
  end

  def show
    @property = Property.find(params[:id])
    @markers = [{

      lat: @property.latitude,
      lng: @property.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { property: @property })

    }]
  end
end
