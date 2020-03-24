class InvestmentsController < ApplicationController
  def new
    @property = Property.find(params[:property_id])
    @investment = Investment.new
  end

  def create
    @property = Property.find(params[:property_id])
    @investment = Investment.new(investments_params)
    @investment.user = current_user
    @investment.property = @property
    if @investment.save && params[:investment][:terms_accepted] == "1"
      redirect_to root_path
    else
      @property = Property.find(params[:property_id])
      @investment = Investment.new
      render :new
    end
  end


private

def investments_params
  params.require(:investment).permit(:amount, :terms_accepted)
end

end
