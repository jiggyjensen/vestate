class UsersController < ApplicationController

  def accept_investor
  @user = User.find(params[:id])
  @user.validated_investor = true
  @user.save
  redirect_to dashboards_path
  end

  def reject_investor
  end


  def accept_developer
  @user = User.find(params[:id])
  @user.validated_developer = true
  @user.save
  redirect_to dashboards_path
  end
end
