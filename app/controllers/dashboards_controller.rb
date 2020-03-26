class DashboardsController < ApplicationController
  def index
    @solid_nav = true
    if current_user.investments.any?
    @investments = current_user.investments
    end
  end

  def show
    @solid_nav = true
  end
end
