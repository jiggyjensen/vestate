class DashboardsController < ApplicationController
  def index

    if current_user.investments.any?
    @investments = current_user.investments
    end
  end

  def show
  end
end
