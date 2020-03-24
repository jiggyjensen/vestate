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

 # t.date "entry_date"
 #    t.string "amount"
 #    t.date "exit_date"
 #    t.bigint "user_id"
 #    t.bigint "property_id"
 #    t.datetime "created_at", null: false
 #    t.datetime "updated_at", null: false
