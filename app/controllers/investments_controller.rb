class InvestmentsController < ApplicationController
  def new
    @solid_nav = true
    @property = Property.find(params[:property_id])
    @investment = Investment.new
  end
  def create
    @property = Property.find(params[:property_id])
    @investment = Investment.new(investments_params)
    @investment.user = current_user
    @investment.property = @property
    if @investment.save && params[:investment][:terms_accepted] == "1"
      redirect_to property_path(@property)
    else
      @property = Property.find(params[:property_id])
      @investment = Investment.new
      render :new
      flash[:alert] = "Please accept the terms and conditions"
    end
  end

private
def investments_params
  params.require(:investment).permit(:amount, :terms_accepted)
end
end
