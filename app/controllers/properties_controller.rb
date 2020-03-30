class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def new

    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      redirect_to property_path(@property)
    else
      render :new
    end
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

    @solid_nav = true

  end

  def show
    @solid_nav = true
    @property = Property.find(params[:id])
    @markers = [{

      lat: @property.latitude,
      lng: @property.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { property: @property })

    }]
  end


private

def property_params
    params.require(:property).permit(:name, :location, :description, :area_description, :valuation, :amount_to_be_raised, :dividend, :financials, :end_date, :photo, documents: [])
end

end
