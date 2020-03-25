class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      redirect_to root_path
    else
      render :new
    end
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
      lng: @property.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { property: @property })

    }]
  end

private

def property_params
    params.require(:property).permit(:name, :location, :description, :area_description, :valuation, :amount_to_be_raised, :dividend, :financials)
end

end
