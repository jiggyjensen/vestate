class LikesController < ApplicationController
  before_action :set_property

  def create
    @property.likes.create(user_id: current_user.id)
    respond_to do |format|
    format.html { redirect_to properties_path }
    format.js
    end
  end

  def destroy
    @property.likes.find_by(user_id: current_user.id).destroy
    respond_to do |format|
    format.html { redirect_to properties_path }
    format.js
    end
  end

  private

  def set_property
    @property = Property.find(params[:property_id])
  end


end
