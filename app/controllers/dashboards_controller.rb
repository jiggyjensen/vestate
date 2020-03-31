class DashboardsController < ApplicationController
  def index

    if current_user.investments.any?
    @investments = current_user.investments
    end
    @developers = User.where(validated_developer: false)
    @investors = User.where(validated_investor: false)
  end


  def show
  end
end
