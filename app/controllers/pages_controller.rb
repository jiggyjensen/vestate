class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :home_developers]

  def home
     @properties = Property.first(3)
  end

  def home_developers
  end
end

