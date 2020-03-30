class LikesController < ApplicationController
  before_action :set_property

  def create
    @property.likes.create(user_id: current_user.id)
    redirect_to properties_path
  end

  private

  def set_property
    @property = Property.find(params[:property_id])
  end


end
